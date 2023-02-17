SELECT conrelid::regclass AS nome_tabela, 
           conname AS foreign_key, 
           pg_get_constraintdef(oid) 
    FROM   pg_constraint 
    WHERE  contype = 'f' 
    AND    connamespace = 'public'::regnamespace   
    ORDER  BY conrelid::regclass::text, contype DESC;