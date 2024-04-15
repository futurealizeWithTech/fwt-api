import { NextRequest, NextResponse } from "next/server";
import { prisma, prismaConnect } from "@/utils/prisma/prisma";

export async function GET(
  req: NextRequest,
  { params }: { params: { messageId: string } }
) {
  try {
    await prismaConnect();
    const messageId = params.messageId;
    const message = await prisma.message.findUnique({
      where: {
        id: Number(messageId),
      },
    });
    return NextResponse.json({ message }, { status: 200 });
  } catch (error) {
    return NextResponse.json({ error }, { status: 500 });
  } finally {
    prisma.$disconnect();
  }
}
