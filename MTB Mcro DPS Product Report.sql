SELECT  b.cust_no cif_no, 
        a.acct_type, 
        a.int_cat sub_catagory, 
        e.descript,b.name_as_id_proof, 
        getchkdgt(substr(a.key_1,-13)) acct_no, 
        a.curr_bal current_balance ,
        (ut0030(acct_open_dt )) acct_open_dt, 
        g.br_name, 
        a.branch_no, 
        id_number nid, 
        f.ex_attribute_7 mbl_no, 
        h.sex_code  

FROM    invm a,
        cext b,  
        (SELECT * FROM cuid WHERE id_type='0001')c,
        invb d, 
        depp e, 
        cusm f, 
        brhm g, 
        cusvdd h 
        
WHERE   a.customer_no = b.cust_no  
        AND a.acct_type='1308' 
        AND a.int_cat in (1009,1010)  
        AND a.customer_no = c.cust_no (+)  
        AND a.key_1=d.key_1  
        AND a.acct_type= e.type    
        AND a.int_cat=e.int_cat     
        AND a.customer_no= f.cust_acct_no  
        AND a.branch_no= substr(g.key_1,-5)  
        AND a.customer_no= substr(h.key_1,4,16)
        ORDER BY acct_open_dt DESC