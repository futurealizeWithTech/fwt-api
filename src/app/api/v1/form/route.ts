import { NextResponse } from "next/server";
import { prisma, prismaConnect } from "@/utils/prisma/prisma";

export const POST = async (req: Request, res: NextResponse) => {
  const { memberName, body, cardDesign, mentorId } = await req.json();

  try {
    await prismaConnect();
    const messageData = await prisma.message.create({
      data: {
        memberName,
        body,
        cardDesign,
        mentorId,
      },
    });
    return NextResponse.json({ messageData }, { status: 201 });
  } catch (error) {
    return NextResponse.json({ message: "失敗", error }, { status: 500 });
  } finally {
    prisma.$disconnect();
  }
};
