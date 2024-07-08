

module uart_send(
    input	      sys_clk,                  //ϵͳʱ��
    input         sys_rst_n,                //ϵͳ��λ���͵�ƽ��Ч
    
    input         uart_en,                  //����ʹ���ź�
    input  [7:0]  uart_din,                 //����������
    output        uart_tx_busy,             //����æ״̬��־      
    output  reg   uart_txd                  //UART���Ͷ˿�
    );
    
//parameter define
parameter  CLK_FREQ = 50000000;            //ϵͳʱ��Ƶ��
parameter  UART_BPS = 9600;                //���ڲ�����
localparam  BPS_CNT  = CLK_FREQ/UART_BPS;   //Ϊ�õ�ָ�������ʣ���ϵͳʱ�Ӽ���BPS_CNT��

//reg define
reg        uart_en_d0; 
reg        uart_en_d1;  
reg [15:0] clk_cnt;                         //ϵͳʱ�Ӽ�����
reg [ 3:0] tx_cnt;                          //�������ݼ�����
reg        tx_flag;                         //���͹��̱�־�ź�
reg [ 7:0] tx_data;                         //�Ĵ淢������

//wire define
wire       en_flag;

//*****************************************************
//**                    main code
//*****************************************************
//�ڴ��ڷ��͹����и���æ״̬��־
assign uart_tx_busy = tx_flag;

//����uart_en�����أ��õ�һ��ʱ�����ڵ������ź�
assign en_flag = (~uart_en_d1) & uart_en_d0;

//�Է���ʹ���ź�uart_en�ӳ�����ʱ������
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin
        uart_en_d0 <= 1'b0;                                  
        uart_en_d1 <= 1'b0;
    end                                                      
    else begin                                               
        uart_en_d0 <= uart_en;                               
        uart_en_d1 <= uart_en_d0;                            
    end
end

//�������ź�en_flag����ʱ,�Ĵ�����͵����ݣ������뷢�͹���          
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin                                  
        tx_flag <= 1'b0;
        tx_data <= 8'd0;
    end 
    else if (en_flag) begin                 //��⵽����ʹ��������                      
            tx_flag <= 1'b1;                //���뷢�͹��̣���־λtx_flag����
            tx_data <= uart_din;            //�Ĵ�����͵�����
        end
                                            //������ֹͣλ����ʱ��ֹͣ���͹���
        else if ((tx_cnt == 4'd9) && (clk_cnt == BPS_CNT -(BPS_CNT/16))) begin                                       
            tx_flag <= 1'b0;                //���͹��̽�������־λtx_flag����
            tx_data <= 8'd0;
        end
        else begin
            tx_flag <= tx_flag;
            tx_data <= tx_data;
        end 
end

//���뷢�͹��̺�����ϵͳʱ�Ӽ�����
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)                             
        clk_cnt <= 16'd0;                                  
    else if (tx_flag) begin                 //���ڷ��͹���
        if (clk_cnt < BPS_CNT - 1)
            clk_cnt <= clk_cnt + 1'b1;
        else
            clk_cnt <= 16'd0;               //��ϵͳʱ�Ӽ�����һ�����������ں�����
    end
    else                             
        clk_cnt <= 16'd0; 				    //���͹��̽���
end

//���뷢�͹��̺������������ݼ�����
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)                             
        tx_cnt <= 4'd0;
    else if (tx_flag) begin                 //���ڷ��͹���
        if (clk_cnt == BPS_CNT - 1)			//��ϵͳʱ�Ӽ�����һ������������
            tx_cnt <= tx_cnt + 1'b1;		//��ʱ�������ݼ�������1
        else
            tx_cnt <= tx_cnt;       
    end
    else                              
        tx_cnt  <= 4'd0;				    //���͹��̽���
end

//���ݷ������ݼ���������uart���Ͷ˿ڸ�ֵ
always @(posedge sys_clk or negedge sys_rst_n) begin        
    if (!sys_rst_n)  
        uart_txd <= 1'b1;        
    else if (tx_flag)
        case(tx_cnt)
            4'd0: uart_txd <= 1'b0;         //��ʼλ 
            4'd1: uart_txd <= tx_data[0];   //����λ���λ
            4'd2: uart_txd <= tx_data[1];
            4'd3: uart_txd <= tx_data[2];
            4'd4: uart_txd <= tx_data[3];
            4'd5: uart_txd <= tx_data[4];
            4'd6: uart_txd <= tx_data[5];
            4'd7: uart_txd <= tx_data[6];
            4'd8: uart_txd <= tx_data[7];   //����λ���λ
            4'd9: uart_txd <= 1'b1;         //ֹͣλ
            default: ;
        endcase
    else 
        uart_txd <= 1'b1;                   //����ʱ���Ͷ˿�Ϊ�ߵ�ƽ
end

endmodule	          