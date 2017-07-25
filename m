Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGsb42CDgzDqlC
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 18:58:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="uP1qdyEr"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 3xGsb4192xz9s78; Tue, 25 Jul 2017 18:58:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1500973088; bh=0+kl/ECSz+Ugsjab5pJaCG93FDPsjjd+FXywMo2FYV8=;
 h=From:To:Cc:Subject:Date:From;
 b=uP1qdyErx2AXzFFHEVmPeGDJ+LjtzkR4gyYK7G+qfNXDtwOBzyLLvBLXVArls2Qiz
 KpDnwqGHt15WtTSCEm3TgnZXGMBznV85pgwhjLIo4ybrZmUMnMnHMBqSIu9nZqRzEt
 Kb16p9+bNnfx4LnVCKAdOrB+L/IcUM1782xwjaH9MrnLncSMu9A0YW+jaenHqgvYMt
 Z4OewuHXlj7QH1VL5JN9L+lBfCJpJdf6DTtQ+/rRsHlcr5MqwSnTHVRxEzSIe2lqxI
 oI7Fvu5p82937B+hVlr35viUZ3F4pqrDVgL4kJsqTYpfCXz8AQZUxm1R7It3X3hnaK
 BR97tJCa8Fw+w==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, Jeremy Kerr <jk@ozlabs.org>,
 Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH RFC] tty: don't force !TTYB_NORMAL flip buffers if not required
Date: Tue, 25 Jul 2017 16:57:26 +0800
Message-Id: <1500973046-14268-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 08:58:10 -0000

In change acc0f67f30, we introduced flip buffers that skipped allocation
of the flags buffer for characters received with TTY_NORMAL flags.

However, the slow path of tty_insert_flip_char() calls
tty_insert_flip_string_flags() (providing a flag buffer pointer), which
forces the buffer code to allocate a !TTYB_NORMAL buffer. If we took the
slow path due to running out of buffer space, rather than seeing
!TTY_NORMAL flags, we've needlessly allocated a flags buffer.

This change uses tty_insert_flip_string_fixed_flag instead, which will
allocate TTYB_NORMAL buffers if flag == TTY_NORMAL. Since we're only
inserting one character, it's fine for the flag to be "fixed".

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
CC: Peter Hurley <peter@hurleysoftware.com>

---
RFC: I'm certainly no expert on the tty layer, and perhaps there's a
good reason to always allocate a flags buffer. However, this seems to
relieve buffer pressure in my tests.

---
 include/linux/tty_flip.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tty_flip.h b/include/linux/tty_flip.h
index c28dd52..15d03a1 100644
--- a/include/linux/tty_flip.h
+++ b/include/linux/tty_flip.h
@@ -26,7 +26,7 @@ static inline int tty_insert_flip_char(struct tty_port *port,
 		*char_buf_ptr(tb, tb->used++) = ch;
 		return 1;
 	}
-	return tty_insert_flip_string_flags(port, &ch, &flag, 1);
+	return tty_insert_flip_string_fixed_flag(port, &ch, flag, 1);
 }
 
 static inline int tty_insert_flip_string(struct tty_port *port,
-- 
2.7.4
