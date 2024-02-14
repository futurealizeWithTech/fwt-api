import { PrismaClient } from '@prisma/client';

export const prisma = new PrismaClient();

// DBに接続する
export const prismaConnect = async () => {
  try {
    await prisma.$connect();
  } catch (e) {
    return Error('DB接続に失敗しました');
  };
};
