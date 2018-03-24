Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22b; helo=mail-ua0-x22b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bBNFHuyy"; 
 dkim-atps=neutral
Received: from mail-ua0-x22b.google.com (mail-ua0-x22b.google.com
 [IPv6:2607:f8b0:400c:c08::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 407SgQ5p6YzF1l2
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 15:52:01 +1100 (AEDT)
Received: by mail-ua0-x22b.google.com with SMTP id s92so9050122uas.11
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 21:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mUDsqdShfkYSAjdBZcyvT9snN2h9FCyW2JrchB6Ev8k=;
 b=bBNFHuyyqxK6XSRuL8cbYFL80e4byaIZAEUhAdQJQapUT7iNco4mqxkIEnuUnu0E/A
 fKRM9o54Iu1fxur7Ke6ce/ccTxNTzg6E5q4Z8A70l7IWrZ6wDEAZ3kSnj2fd9ANbEydE
 6FEx1uiRLt1LEgnERjJE0zxc0ivwenW89Hksrc+CR7ASLKSLsK4vK0X+/XlvBq9c7I2L
 h2t0cKL4nSLP2FvOyMh/Rll4gHlDWoFm7ToFVEgZmn018Uegifi0nOiIaWR6CxVcsoCA
 4SN7fdgnRV02TXCeI81AJJA/gVf4O/zrdbtVNdemu/DH5tISs3HxpYPlcJKkqHDuuUGg
 nvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mUDsqdShfkYSAjdBZcyvT9snN2h9FCyW2JrchB6Ev8k=;
 b=V6al9C5Ywt/H+SrtNmx5j19biVllCWfarkc0M8FReSG5MYMCPxE3y92cn09OhVVEi/
 CzDRBlvbfNnGaqwJhP6Gj4SjvPM25bSoE/73ihR4eo7Ihqr5bfn4FfBaEAINiaIgfve4
 8jTZF3wGtopU/P1LHdck1IcCi3reoA4G/K7RpWSuYVEr+ZxHylLqmX9bg5vlz4sYhuTB
 KnNDRc6NmyUiuSfCX7THFX0oBRDKncknKgRx3B3MM8q+lWDlUCu/wBH+CXM2MQ2c5z9x
 d2liG8QSNryOEpqvT8iEmfxsXCW3FKGxjMif8gEAH4V54ewYT7Lks+x+fIODEWTzht3r
 xumg==
X-Gm-Message-State: AElRT7FMiLPGadzINC3kjWLZ9fYn0bHgcPlhPUWeffkOPhk1IJ6DKLF2
 56tmDSW0rTdW1699NO2aqNfG0FaQvVe6eizFrbIjDA6f
X-Google-Smtp-Source: AG47ELtPtjCCyW93RInIULbQk84ubS9zanVG0lyTdVn6/JkwmCNhF9qBCGHRrQzCA076SFRagZH72vryen/zztSC/SE=
X-Received: by 10.176.71.78 with SMTP id i14mr21431092uac.177.1521867118637;
 Fri, 23 Mar 2018 21:51:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Fri, 23 Mar 2018 21:51:37 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Mar 2018 21:51:37 -0700
Message-ID: <CAO=notwCxfVJGwD=m-Dc=R6EvhKgBnk8hderrmkt=QHcuGcAug@mail.gmail.com>
Subject: BMC Health Watchdog
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Sat, 24 Mar 2018 04:52:03 -0000

I've been on a BMC health kick lately.  Mostly because it's something
I think we all want and have different requirements.

Outside of exporting the BMC health information, which could be done
from the same watchdog daemon, -- what requirements has everybody run
into?

IIRC, the facebook presentation at the summit indicated they were
tracking BMC health -- thoughts?

Patrick
