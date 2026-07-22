/*
CREATE TABLE users_ (
    user_id     INT IDENTITY(1,1) PRIMARY KEY,
    username    VARCHAR(50) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    phone       VARCHAR(20) UNIQUE NOT NULL,
    password    VARCHAR(100) NOT NULL
);
 
CREATE TABLE profile (
    profile_id     INT IDENTITY(1,1) PRIMARY KEY,
    user_id        INT UNIQUE NOT NULL,
    name           VARCHAR(100),
    bio            NVARCHAR(200),
    date_of_birth  DATE,
    gender         VARCHAR(10) CHECK (gender IN ('male', 'female')),
    location       VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users_(user_id)
);
 
CREATE TABLE messages (
    message_id     INT IDENTITY(1,1) PRIMARY KEY,
    sender_id      INT NOT NULL,
    receiver_id    INT NOT NULL,
    content        NVARCHAR(MAX) NOT NULL,
    sent_at        DATETIME DEFAULT GETDATE(),
    status         VARCHAR(10) CHECK (status IN ('sent', 'delivered', 'read')) DEFAULT 'sent',
    FOREIGN KEY (sender_id)   REFERENCES users_(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users_(user_id)  -- NO ACTION (default) to avoid multi-cascade-path error
);
 
CREATE TABLE services (
    service_id     INT IDENTITY(1,1) PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    description    VARCHAR(500),
    price          DECIMAL(10,2) NOT NULL,
    duration_days  INT,
    is_active      BIT DEFAULT 1
);
 
CREATE TABLE user_services (
    user_service_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id         INT NOT NULL,
    service_id      INT NOT NULL,
    purchase_date   DATETIME DEFAULT GETDATE(),
    expiry_date     DATETIME,
    status          VARCHAR(10) CHECK (status IN ('active', 'expired', 'cancelled')) DEFAULT 'active',
    FOREIGN KEY (user_id)    REFERENCES users_(user_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);
 
CREATE TABLE payments (
    payment_id       INT IDENTITY(1,1) PRIMARY KEY,
    user_service_id  INT NOT NULL,
    amount           DECIMAL(10,2) NOT NULL,
    payment_date     DATETIME DEFAULT GETDATE(),
    payment_method   VARCHAR(50),
    transaction_ref  VARCHAR(100),
    status           VARCHAR(10) CHECK (status IN ('pending', 'success', 'failed')) DEFAULT 'pending',
    FOREIGN KEY (user_service_id) REFERENCES user_services(user_service_id)
);
 
 
SET IDENTITY_INSERT users_ ON;
INSERT INTO users_ (user_id, username, email, phone, password) VALUES
(1, 'ahmad_k',   'ahmad.k@example.com',   '0791234561', 'hash_1a2b3c'),
(2, 'sara_m',    'sara.m@example.com',    '0791234562', 'hash_2b3c4d'),
(3, 'omar_z',    'omar.z@example.com',    '0791234563', 'hash_3c4d5e'),
(4, 'lina_r',    'lina.r@example.com',    '0791234564', 'hash_4d5e6f'),
(5, 'yousef_t',  'yousef.t@example.com',  '0791234565', 'hash_5e6f7g'),
(6, 'huda_n',    'huda.n@example.com',    '0791234566', 'hash_6f7g8h');
SET IDENTITY_INSERT users_ OFF;
 
SET IDENTITY_INSERT profile ON;
INSERT INTO profile (profile_id, user_id, name, bio, date_of_birth, gender, location) VALUES
(1, 1, 'Ahmad Khaled',  'AI enthusiast and backend developer.',    '1999-03-12', 'male',   'Amman, Jordan'),
(2, 2, 'Sara Mahmoud',  'UI/UX designer who loves clean layouts.', '2000-07-25', 'female', 'Irbid, Jordan'),
(3, 3, 'Omar Ziad',     'Full-stack developer.',                   '1998-11-02', 'male',   'Zarqa, Jordan'),
(4, 4, 'Lina Rami',     'Product manager, coffee addict.',         '1997-05-19', 'female', 'Amman, Jordan'),
(5, 5, 'Yousef Tamer',  'Freelancer.',                             '2001-01-30', 'male',   'Aqaba, Jordan'),
(6, 6, 'Huda Nasser',   'Data analyst exploring ML.',              '1999-09-08', 'female', 'Amman, Jordan');
SET IDENTITY_INSERT profile OFF;
 
SET IDENTITY_INSERT messages ON;
INSERT INTO messages (message_id, sender_id, receiver_id, content, status) VALUES
(1, 1, 2, 'Hey Sara, are you free for a call today?', 'read'),
(2, 2, 1, 'Sure, after 5 PM works for me.', 'delivered'),
(3, 3, 4, 'Did you check the new service pricing?', 'sent'),
(4, 4, 3, 'Yes, I just subscribed to the premium plan.', 'read'),
(5, 5, 6, 'Can you send me the report file?', 'delivered'),
(6, 6, 5, 'Sending it now, give me a minute.', 'sent');
SET IDENTITY_INSERT messages OFF;
 
SET IDENTITY_INSERT services ON;
INSERT INTO services (service_id, name, description, price, duration_days, is_active) VALUES
(1, 'Premium Chat',        'Unlimited messaging with no ads.', 4.99, 30, 1),
(2, 'Voice Calls Add-on',  'Enables voice calling between users.', 2.99, 30, 1),
(3, 'Video Calls Add-on',  'Enables video calling between users.', 3.99, 30, 1),
(4, 'Profile Boost',       'Highlights your profile for more visibility.', 1.99, 7, 1),
(5, 'Cloud Backup',        'Backs up your chat history to the cloud.', 5.99, 30, 1),
(6, 'Lifetime Ad-Free',    'One-time payment to remove ads permanently.', 19.99, NULL, 1);
SET IDENTITY_INSERT services OFF;
 
SET IDENTITY_INSERT user_services ON;
INSERT INTO user_services (user_service_id, user_id, service_id, expiry_date, status) VALUES
(1, 1, 1, DATEADD(DAY, 30, GETDATE()), 'active'),
(2, 2, 3, DATEADD(DAY, 30, GETDATE()), 'active'),
(3, 3, 5, DATEADD(DAY, 30, GETDATE()), 'active'),
(4, 4, 6, NULL, 'active'),
(5, 5, 2, DATEADD(DAY, -5, GETDATE()), 'expired'),
(6, 6, 4, DATEADD(DAY, 7, GETDATE()), 'active');
SET IDENTITY_INSERT user_services OFF;
 
SET IDENTITY_INSERT payments ON;
INSERT INTO payments (payment_id, user_service_id, amount, payment_method, transaction_ref, status) VALUES
(1, 1, 4.99,  'credit_card', 'TXN-100001', 'success'),
(2, 2, 3.99,  'paypal',      'TXN-100002', 'success'),
(3, 3, 5.99,  'credit_card', 'TXN-100003', 'success'),
(4, 4, 19.99, 'wallet',      'TXN-100004', 'success'),
(5, 5, 2.99,  'credit_card', 'TXN-100005', 'failed'),
(6, 6, 1.99,  'paypal',      'TXN-100006', 'success');
SET IDENTITY_INSERT payments OFF;



*/

update users_ set phone='0772345567' where user_id=1;
update users_ set email = 'a@gmail.com' where user_id=1;


UPDATE profile SET location = 'Dubai, UAE' WHERE profile_id = 1;
UPDATE profile SET bio = 'Senior UI/UX designer.' WHERE profile_id = 2;


UPDATE messages SET status = 'read' WHERE message_id = 3;
UPDATE messages SET content = 'Sending it now, check your inbox.' WHERE message_id = 6;


UPDATE services SET price = 5.99 WHERE service_id = 1;
UPDATE services SET is_active = 0 WHERE service_id = 4;


UPDATE payments SET status = 'success' WHERE payment_id = 5;
UPDATE payments SET payment_method = 'credit_card' WHERE payment_id = 6;


delete from users_ where USER_ID in (5 ,6);
DELETE FROM payments WHERE user_service_id IN (3, 4);
DELETE FROM services WHERE service_id IN (5, 6);
delete from messages where message_id in (5 ,6);
DELETE FROM user_services WHERE user_service_id IN (3, 4);
delete from profile where profile_id in (5 ,6);



exec sp_rename 'users_' ,'user';
EXEC sp_rename 'messages', 'message';

EXEC sp_rename 'profile.name', 'username', 'column';

alter table users alter column phone varchar(30);
alter table profile alter column bio nvarchar(500);
