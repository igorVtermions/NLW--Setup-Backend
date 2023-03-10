/*
  Warnings:

  - You are about to drop the `habit_week_ days` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "days_date_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "habit_week_ days";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "habit_week_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    CONSTRAINT "habit_week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "habit_week_days_habit_id_week_day_key" ON "habit_week_days"("habit_id", "week_day");

-- CreateIndex
CREATE INDEX "days_date_idx" ON "days"("date");
