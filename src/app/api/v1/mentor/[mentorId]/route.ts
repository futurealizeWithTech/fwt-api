import { NextRequest, NextResponse } from "next/server";
import { prisma, prismaConnect } from "@/utils/prisma/prisma";

export const GET = async (
  req: NextRequest,
  { params }: { params: { mentorId: Number } }
) => {
  try {
    await prismaConnect();
    const mentorId = params.mentorId;
    const messages = await prisma.message.findMany({
      where: {
        mentorId: Number(mentorId),
      },
    });
    return NextResponse.json({ messages }, { status: 201 });
  } catch (error) {
    return NextResponse.json({ error }, { status: 500 });
  } finally {
    prisma.$disconnect();
  }
};
