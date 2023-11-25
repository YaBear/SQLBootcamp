COMMENT ON TABLE person_discounts IS 'Таблица для хранения данных о скидках людей в определенных пиццериях, основываясь на количестве сделанных заказов человека';

COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записей таблицы';

COMMENT ON COLUMN person_discounts.person_id IS 'Личный идентификатор человека в соответствии с таблицей Person';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Личный идентификатор пиццерии в соответствии с таблицей Pizzeria';

COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки определенного человека в определенной пиццерии';