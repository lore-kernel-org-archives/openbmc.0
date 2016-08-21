Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com
 [IPv6:2607:f8b0:400e:c03::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sGzlC2CcVzDr3N
 for <openbmc@lists.ozlabs.org>; Sun, 21 Aug 2016 11:34:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=kbKQmj41; 
 dkim-atps=neutral
Received: by mail-pa0-x22c.google.com with SMTP id fi15so26825032pac.1
 for <openbmc@lists.ozlabs.org>; Sat, 20 Aug 2016 18:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=av4l0VnZlr65txXYyiluSc7EvhoRIc7gJ/nUAmU/67U=;
 b=kbKQmj410NERzwILPCIjM6CLs3fp987XXuHohPjgV8SwBkevEnfTCt61tQv4JAuOop
 FL6uIZ7ELutdMIJEMuKORtWOuL70kght3RFnfN0zDxS5c8gb0kioQxtDn5QLnFRrmuFT
 RnkzhOF4yncyuIB5Lr7Hcqb+U9sxJUncSBk7AYo2ESN5MGTNQGWS603tfV8U9xYfAvVV
 pw5X/T0ebBZviFuezWk/Ccut1ILlr5I6Ai8HhnanCdWmla385Tt1JfMtCl/wPd68AMvD
 Ar9hHL1fLKWLvJiP0UAYi65tC6tH3JIps9BCtRuQRiUX4axpht5e4av+7FbFWKiz1/fa
 W6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=av4l0VnZlr65txXYyiluSc7EvhoRIc7gJ/nUAmU/67U=;
 b=O4O/Qc0JaqrLeC09mi8JqtaKHEwnwrI4VaUyElW6eQDa79hxJWWySqvG80ekKlUh7r
 INitn+8DcxaScqpv8K2fMc8YUccI0tZ3UdeTyzg/4LjB9K53pEBgjnzGl5dPXhvbvlSt
 cP7RzvPhS7RiG3glpy+d94/aTU/Ac79+ZktriuO2CcHVCCnvLo2j9bNxIzZiYieWCz3e
 4Q/Yv/9SHVvtD0ZZi12UfhidlKv0F1cNz/cMU51UsUM0Zbl4Y25d4S/jKAi+bJiyASii
 kBJiUnl/WLpg09J2sBX7pocbYNvimN1yp99yKkXgOSdDuw8UlKApwdDL8p5kAlyngzGN
 LLVA==
X-Gm-Message-State: AEkoouu5J3oxLXSn3sjd0O7LIylKywiITnw6g3Yk6j/SOAr19qVeIHMd+XLR0sMQ6ghi5JKf
X-Received: by 10.66.72.40 with SMTP id a8mr28717653pav.15.1471743266704;
 Sat, 20 Aug 2016 18:34:26 -0700 (PDT)
Received: from mactruck.mtv.corp.google.com ([172.18.64.18])
 by smtp.gmail.com with ESMTPSA id bw10sm21772578pac.27.2016.08.20.18.34.25
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 20 Aug 2016 18:34:26 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] i2c: aspeed: ready driver for upstream
Date: Sat, 20 Aug 2016 18:34:16 -0700
Message-Id: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Sun, 21 Aug 2016 01:34:31 -0000

Did the cleanup of the i2c-aspeed driver. In the process, I found that the
EEPROM on the ast2500 evbs does not do ACK polling properly after a dummy write
before a read; so I added a quirk for that in the at24 EEPROM driver. It appears
that this problem was not apparent before because the driver took longer to
perform commands.

The goal of this patch set is to get the i2c-aspeed driver ready for upstream.
If you see any issues with the driver that would prevent upstreaming, please let
me know so I can fix it before the patch is applied.

I have tested my changes on the ast2500 evb, but not the ast2400 or any other
variants.

I have a TODO to add support for I2C protocol mangling: I added support for
sending stops between transfers (for the EEPROM quirk), but I did not yet add
support for any other types of I2C protocol mangling; I don't think that this
should cause any issues upstreaming, however.

I also have a change for i2c-core that I am working on for adding slave mode
support for SMBus Alert and I would like to use the i2c-aspeed driver and the
SSIF driver as the initial users of this new feature; I already mentioned this
to Wolfram Sang <wsa@the-dreams.de>.

Cheers,
Brendan
