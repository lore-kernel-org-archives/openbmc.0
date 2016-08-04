Return-Path: <xow@google.com>
Received: from mail-pa0-x22b.google.com (mail-pa0-x22b.google.com
 [IPv6:2607:f8b0:400e:c03::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s52Cq6cb8zDqQs
 for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2016 06:51:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=bhh6BCe8; 
 dkim-atps=neutral
Received: by mail-pa0-x22b.google.com with SMTP id iw10so85784559pac.2
 for <openbmc@lists.ozlabs.org>; Thu, 04 Aug 2016 13:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnajwSHfDfHBd0i55qC8n7gjIF+SGQDl50BSNC10Z5Y=;
 b=bhh6BCe8CvozhMbgPwP0uaRuDTMGQXA2vBjyafycMg4BzXTLfDbeQjNGUeSz/9GzaI
 nUWXMhNpymX7m5GbEKlAM2QyjlagrBUfpf/EmORRj1b2CH6VLauxHFePGbNdBmHUpDlg
 an3tUcf7dbcdNi5I4U7QtbyYHgcjbA516p6X2dbV3yARXmbwPT579+vWidlt2mkfp3c2
 JWi9ZhBtVBFLrp59gC76RECCiJiTPxaZJXW16Ih4PP1Ecrj5jfOdhniUf1/0uCuj60u6
 vIofhjAA+3CcDvcA/X1zcImThiTUo2SPrKoeaGoAxmimxzYiggWuv5NBSjMlKhKEUJsY
 jvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnajwSHfDfHBd0i55qC8n7gjIF+SGQDl50BSNC10Z5Y=;
 b=JGNYhXFYTSV9BNcoPmQkfVzVxpwI1b5J7K9fF6qBtl5YtbE0sog1VvQwa4J15oW0BS
 kNZrUIpKfFO0Iu2/azL7gfsxoENyRg/KLG0cKK95yEDzo+SeqmN12qBGeAf+j5RD4fCo
 m3kJyzqklNAr94TvWqUfZGfKQxWPzV/hnpTYkAZqTKlEe49ibnpnI43Td3MDL7axqlwh
 GNU7yMtstrFbRe7oMsrPtsJEEZ/SZGpk9LSdjytZhsPQemH/WwuhktxSh21bFeH/TuJx
 D2JSr61ptaYTxu51PgquKv1VaNaeOI26Za3BbPEc8/71hjqd40kyc2AYAZzDnPQpXJXI
 xTuQ==
X-Gm-Message-State: AEkoouv8ITi8JFpm+1ABcg47xelQTroozCCqYCZV/HI5erYDBUV60t7q6cv6i3OdpTMnsM5F
X-Received: by 10.66.78.35 with SMTP id y3mr128144017paw.40.1470343876045;
 Thu, 04 Aug 2016 13:51:16 -0700 (PDT)
Received: from pewter.mtv.corp.google.com ([172.18.64.22])
 by smtp.gmail.com with ESMTPSA id c125sm22453495pfc.40.2016.08.04.13.51.14
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Aug 2016 13:51:14 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/3] Port Aspeed VUART driver to 4.6/AST2500
Date: Thu,  4 Aug 2016 13:51:01 -0700
Message-Id: <1470343863-81892-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2016 20:51:21 -0000

Hi folks,

I've been experimenting with LPC by attaching a machine to the LPC header on
the AST2500 EVB. I had VUART enabled and discarding bytes to test LPC
functionality. But, I wanted to see the actual bytes on-screen so I ported
these patches to the kernel we're using for the AST2500.

The patches are tested on the EVB (with uart6 enabled in the dts) to verify
that bytes appeared on the TTY. obmc-console-server/-client also work after
aliasing ttyS5 to uart6 as configured in the phosphor image.

cheers
xo
