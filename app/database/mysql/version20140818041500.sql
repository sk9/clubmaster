INSERT INTO club_task_task (task_name,enabled,locked,event,method,task_interval,created_at,updated_at) VALUES ('Draw subscription', 1, 0, '\\Club\\TaskBundle\\Event\\Events', 'onSubscriptionDrawTask','T5M',now(),now());
CREATE TABLE club_quickpay_draw (id INT AUTO_INCREMENT NOT NULL, order_id INT DEFAULT NULL, amount NUMERIC(10, 2) NOT NULL, currency VARCHAR(255) NOT NULL, transaction VARCHAR(255) NOT NULL, status INT NOT NULL, log LONGTEXT DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_E00EEBA58D9F6D38 (order_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
ALTER TABLE club_quickpay_draw ADD CONSTRAINT FK_E00EEBA58D9F6D38 FOREIGN KEY (order_id) REFERENCES club_shop_order (id);
