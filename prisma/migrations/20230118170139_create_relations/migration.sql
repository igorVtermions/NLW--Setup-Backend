/*
  Warnings:

  - You are about to drop the column `habitId` on the `habit_week_ days` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_habit_week_ days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    CONSTRAINT "habit_week_ days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_habit_week_ days" ("habit_id", "id", "week_day") SELECT "habit_id", "id", "week_day" FROM "habit_week_ days";
DROP TABLE "habit_week_ days";
ALTER TABLE "new_habit_week_ days" RENAME TO "habit_week_ days";
CREATE UNIQUE INDEX "habit_week_ days_habit_id_week_day_key" ON "habit_week_ days"("habit_id", "week_day");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
