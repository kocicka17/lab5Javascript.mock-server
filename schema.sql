-- Універсальна схема для навчального REST API.
-- Один запис = один об'єкт будь-якої сутності будь-якого варіанта.
-- Конкретні атрибути сутності (Назва, Автор, ПІБ тощо) зберігаються
-- у стовпці data у форматі JSON, тому таблицю не потрібно змінювати
-- під кожен варіант чи кожну сутність.

CREATE DATABASE IF NOT EXISTS js_course_api
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE js_course_api;

CREATE TABLE IF NOT EXISTS entities (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  entity_type  VARCHAR(100)    NOT NULL COMMENT 'довільна назва сутності студента, напр. book_ivanenko',
  data         JSON            NOT NULL COMMENT 'усі атрибути об'"'"'єкта у форматі JSON',
  created_at   TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
  updated_at   TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_entity_type (entity_type)
) ENGINE=InnoDB;

-- Приклад запису (лише для довідки, не виконується автоматично):
-- INSERT INTO entities (entity_type, data)
-- VALUES ('book_ivanenko', '{"title": "Кобзар", "author": "Тарас Шевченко"}');
