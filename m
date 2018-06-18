Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="us13iLtJ"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418H5K2zKVzF0dl
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 13:44:05 +1000 (AEST)
Received: by mail-pg0-x242.google.com with SMTP id l65-v6so6880200pgl.8
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 20:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=WY5i6AX+CvuypR0HzwoBl+tj5BAOLaZ3GZqYD4cSm7U=;
 b=us13iLtJjA+Wx9fECbYSQJAJ8b5Jy1qDztskgJ1DdCOpgH9vH58YxsjTtUbdZiNGEv
 gNQvDqo2Np8R9sSBGwH5jRZiowLG759HPWfwVAUW3wSJk8xI976kslz0Lacuot5n3TE7
 tsBl/qdb5RvV24rTYhlxAaKoNr1ycaB/Xv19OLsis/8AgY/kXnVvZGC5LTo1qKWvFp9G
 uXNdZ4FgTSAUuY4HtPhTGuISVPgApn+CjybSqZRMdMxRZRzCdWNycJwf2pVfNdLBua3G
 SthpxAHfdgvbeNy7jj+M+kgq3pGkR7iq0JWWgvgjMMmUJAnktMyyu7vxjJK2E1r+tO8w
 bnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=WY5i6AX+CvuypR0HzwoBl+tj5BAOLaZ3GZqYD4cSm7U=;
 b=VbLjwV0ZLAdnGdNNKguID927kZ0+ys6M44utR2skrZ6p5SLw1jhAYfPiOpVtvqxuBc
 CvZ8kjS3fAmChdn+WqJkFuLE4C/WixXIF1SL5pjmr/hmV9Z9o9asgRN7/KoIRPRf77EY
 uh4UzMeN7TR085GQHm0CEsNl0qVXPgejL1TD0vvD01XeoXGQvJhJtijK51KIjAOyPmRt
 C6i4er0LIEr1LfwBbBputTdjVhl2tcze4d/70644P72O1fc0jRf3avKUBnaq4L4Efqs5
 ePGPr+fTwwJAcEZhsxizt5gVC4RA3W11HoYtONJ2LvSgsgBEyEH4mXLAj/RQgoWso5tK
 fnQg==
X-Gm-Message-State: APt69E38hxO3zgGfCinzyz5nTrk4WEj+hvTMKDIj7sDkn8331mwWDHjJ
 5UJqux4aCPZDdynfaLsGsN3IWe1F
X-Google-Smtp-Source: ADUXVKI+6KY5OhZ3S8ERfXgTnEz12C9ml5D8eMvUuQ5I2DtayUDIOlQ0kf3AnUk7N1sP25eCVblJWA==
X-Received: by 2002:a65:6157:: with SMTP id
 o23-v6mr9734447pgv.310.1529293443059; 
 Sun, 17 Jun 2018 20:44:03 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id n72-v6sm25876577pfj.68.2018.06.17.20.44.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 20:44:02 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 18 Jun 2018 13:13:57 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 3/5] fsi: sbefifo: Fix sparse warnings
Date: Mon, 18 Jun 2018 13:13:33 +0930
Message-Id: <20180618034335.9732-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180618034335.9732-1-joel@jms.id.au>
References: <20180618034335.9732-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 03:44:05 -0000

fsi-sbefifo.c:547:58: warning: incorrect type in argument 2 (different base types)
fsi-sbefifo.c:547:58:    expected restricted __be32 [usertype] *word
fsi-sbefifo.c:547:58:    got unsigned int *<noident>
fsi-sbefifo.c:635:16: warning: incorrect type in assignment (different base types)
fsi-sbefifo.c:635:16:    expected unsigned int [unsigned] <noident>
fsi-sbefifo.c:635:16:    got restricted __be32 [usertype] <noident>
fsi-sbefifo.c:636:16: warning: incorrect type in assignment (different base types)
fsi-sbefifo.c:636:16:    expected unsigned int [unsigned] <noident>
fsi-sbefifo.c:636:16:    got restricted __be32 [usertype] <noident>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index e6882a2b1709..4f076fd2939c 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -519,9 +519,10 @@ static int sbefifo_send_command(struct sbefifo *sbefifo,
 static int sbefifo_read_response(struct sbefifo *sbefifo, struct iov_iter *response)
 {
 	struct device *dev = &sbefifo->fsi_dev->dev;
-	u32 data, status, eot_set;
+	u32 status, eot_set;
 	unsigned long timeout;
 	bool overflow = false;
+	__be32 data;
 	size_t len;
 	int rc;
 
@@ -619,7 +620,7 @@ static void sbefifo_collect_async_ffdc(struct sbefifo *sbefifo)
         struct kvec ffdc_iov;
 	__be32 *ffdc;
 	size_t ffdc_sz;
-	u32 cmd[2];
+	__be32 cmd[2];
 	int rc;
 
 	sbefifo->async_ffdc = false;
-- 
2.17.1
