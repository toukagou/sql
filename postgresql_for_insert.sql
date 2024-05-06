-- 创建存储过程
CREATE OR REPLACE FUNCTION insert_data() RETURNS VOID AS $$
DECLARE
    i INTEGER := 1; -- 初始化计数器变量
BEGIN
    -- 设置循环次数为10次（可根据需求进行调整）
    WHILE i <= 10 LOOP
        -- 将要插入的表名、列名以及对应的值修改成自己的情况
        INSERT INTO sample_t_hs_cy (zjhm,sjhm,cyjg_name)
        VALUES (440115199902023360,13600100001,'guangzhou');
        i = i + 1; -- 递增计数器变量
    END LOOP;
    
    RAISE NOTICE '数据插入成功'; -- 输出提示信息
END;
$$ LANGUAGE plpgsql;
 
-- 调用存储过程
SELECT insert_data();

-- 再查看插入数据
select * from sample_t_hs_cy;
-- 统计数量
select count(*) from sample_t_hs_cy;
