import { NextResponse } from "next/server";
import { prisma, prismaConnect } from "@/utils/prisma/prisma";

export const GET = async (req: Request, res: NextResponse) => {
  try {
    await prismaConnect();
    const mentors = await prisma.mentor.findMany({
      include: {
        regions: true,
        courses: true,
      },
    });

    return NextResponse.json({ mentors }, { status: 200 });
  } catch (e) {
    return NextResponse.json({ message: "fetch error", e }, { status: 500 });
  } finally {
    prisma.$disconnect();
  }
};
