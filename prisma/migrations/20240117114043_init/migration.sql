/*
  Warnings:

  - You are about to drop the `MentorTest` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "MentorTest";

-- CreateTable
CREATE TABLE "Mentor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "imageUrl" TEXT,

    CONSTRAINT "Mentor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Message" (
    "id" SERIAL NOT NULL,
    "memberName" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "cardDesign" INTEGER NOT NULL,
    "mentorId" INTEGER NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Course" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Region" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_MentorToRegion" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CourseToMentor" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MentorToRegion_AB_unique" ON "_MentorToRegion"("A", "B");

-- CreateIndex
CREATE INDEX "_MentorToRegion_B_index" ON "_MentorToRegion"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CourseToMentor_AB_unique" ON "_CourseToMentor"("A", "B");

-- CreateIndex
CREATE INDEX "_CourseToMentor_B_index" ON "_CourseToMentor"("B");

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_mentorId_fkey" FOREIGN KEY ("mentorId") REFERENCES "Mentor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MentorToRegion" ADD CONSTRAINT "_MentorToRegion_A_fkey" FOREIGN KEY ("A") REFERENCES "Mentor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MentorToRegion" ADD CONSTRAINT "_MentorToRegion_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CourseToMentor" ADD CONSTRAINT "_CourseToMentor_A_fkey" FOREIGN KEY ("A") REFERENCES "Course"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CourseToMentor" ADD CONSTRAINT "_CourseToMentor_B_fkey" FOREIGN KEY ("B") REFERENCES "Mentor"("id") ON DELETE CASCADE ON UPDATE CASCADE;
