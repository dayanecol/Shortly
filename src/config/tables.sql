CREATE TABLE "users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" varchar(50) NOT NULL UNIQUE,
	"password" varchar(50) NOT NULL,
	"viewsCount" integer DEFAULT '0',
	"createdAt" TIMESTAMP NOT NULL DEFAULT 'NOW()',
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "sessions" (
	"id" serial NOT NULL,
	"userId" integer,
	"token" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT 'NOW()',
	CONSTRAINT "sessions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "urls" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"longUrl" TEXT NOT NULL,
	"shortUrl" TEXT NOT NULL,
	"viewsCount" integer DEFAULT '0',
	"createdAt" TIMESTAMP NOT NULL DEFAULT 'NOW()',
	CONSTRAINT "urls_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "deletedUrls" (
	"id" serial NOT NULL,
	"userId" integer,
	"urlId" integer NOT NULL,
	"longUrl" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT 'NOW()',
	CONSTRAINT "deletedUrls_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "sessions" ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "urls" ADD CONSTRAINT "urls_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "deletedUrls" ADD CONSTRAINT "deletedUrls_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "deletedUrls" ADD CONSTRAINT "deletedUrls_fk1" FOREIGN KEY ("urlId") REFERENCES "urls"("id");