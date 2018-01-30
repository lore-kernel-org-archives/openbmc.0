Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VEpMb+Ft"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVwpK23spzF0T8
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 17:05:13 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id l64so8742403qke.13
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 22:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=MlDbBhUCQAKp/Lx7Gj4JrL+DqyX5bqMXi+V/FYotGC8=;
 b=VEpMb+FtCDXLnEnR8znWaAu5UsDr45bghPgymDqQGfD7vVNwCwXKwnyb+lH17frZZN
 88MG81QSWUvLDBdjFVoHzzOakfnq7ee9d63sa3lilqVEuCDzBECM0iFyduerDf8WDb4v
 M6xx5r/OB2p7x1atQgsaHyb7HBTkUsZv3EwqW+moKVehBfKrDvq2Ip9q73vEIKEYx9Kk
 4fRtTXMdIZqYm1X8a3U0LV9G2Eg8ti/94eYKBsY69UdJojk/xqHbI03w9PKLW0ei6Dfs
 DfRqeE26Or/qKBN5Kvh+SaAkdOv4yXVgSFLlC8oLTez3v1rOX9ARMVSeMUiLTWUnSzjr
 YMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=MlDbBhUCQAKp/Lx7Gj4JrL+DqyX5bqMXi+V/FYotGC8=;
 b=Jrmm2vsQjDbUKLLUzy16nBeLNWkl/j59CWj6eI8u4UHGBZ1X4VvLR09fD2Fd3sqC98
 pVyjY0UlZN9l5hT/cHnaAPKd1r6UPfC9qDCbfbwejV3ReATdPHWEdW9zt8OnUw7tMm+C
 6Imr2vRgsf1U3g25FmyZQTTf0INOXVvtmqwRbyHZ8jrEBtY3SMtp/pMXZ3Ph2XMMpaDN
 U7T6KBiyxpAYtWTQcRcwXVQwdJ2rcX7RsH7WLBkhvziYbmUm5kBMYBV+unS0psMv2td8
 uV0NedkUzX/p+oBZXAGf9WRtWLimLYaN9LFqybRBNwkrptDX1h6PBfhl66YDtQnul7Iq
 PozQ==
X-Gm-Message-State: AKwxytfzsg5ifZVoX+xHmnRuAY6S6shPuB24hpwCzPw9QXUcaZpYx/lA
 N6/byETX8BEjKIB/ijfOfCOoVAnEa+eIuY+brsk=
X-Google-Smtp-Source: AH8x227teC+TI7cUuxm625rcl2nDe7oy7cySWuBu0RCwSYzRRPYSNmEgQH/PcBxjJ3lBwvc1j/0/PswUjEZiqJpLPLc=
X-Received: by 10.55.217.20 with SMTP id u20mr38103860qki.52.1517292310626;
 Mon, 29 Jan 2018 22:05:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.93 with HTTP; Mon, 29 Jan 2018 22:04:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Jan 2018 16:34:50 +1030
X-Google-Sender-Auth: bdY-12DwioopW37y64adv-A6N-M
Message-ID: <CACPK8XeH9uS7G6_k1JLxfx3678U=Dkk_2SYyQSQuQk8GSJ9-Sw@mail.gmail.com>
Subject: Outstanding FSI core patches
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>, eajames <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 06:05:13 -0000

Hello FSI team,

I've got a queue of patches that I've recovered from the openbmc
mailing list and lkml that we should really have had upstream by now.

You can view the list here:

 https://github.com/shenki/linux/commits/fsi-next

I sent out the no-scan-on-init patch today for review by the device tree people.

The rest have all been reviewed in the past. I intend to send them out
for Greg KH to pick up on your behalf. If you have any objections, or
would prefer to send them yourself, please let me know.

Cheers,

Joel

---

Christopher Bostic (3):
      fsi: core: Reduce console output during normal scan
      dt-bindings: fsi: Add optional property no-scan-on-init
      fsi: core: Add check for master property no-scan-on-init

Eddie James (1):
      fsi: Fix one and two byte bus reads/writes

Jeremy Kerr (6):
      fsi: Add fsi_master_rescan()
      fsi: master-gpio: Add locking during break and link enable
      fsi: master-gpio: Add external mode
      dt-bindings: fsi: Add specification for FSI busses
      fsi: Match fsi slaves and engines to available dt nodes
      fsi: master: Clarify master lifetimes & fix use-after-free in hub master
