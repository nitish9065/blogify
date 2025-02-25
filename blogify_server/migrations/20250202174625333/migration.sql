BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "comments" DROP CONSTRAINT "comments_fk_2";
ALTER TABLE ONLY "comments"
    ADD CONSTRAINT "comments_fk_2"
    FOREIGN KEY("repliedOnCommentId")
    REFERENCES "comments"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR blogify
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('blogify', '20250202174625333', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250202174625333', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
