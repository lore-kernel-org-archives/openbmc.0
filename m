Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5lIjOam"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43CrGV34YWzDqdd
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 15:49:53 +1100 (AEDT)
Received: by mail-it1-x12f.google.com with SMTP id g76so15487233itg.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Dec 2018 20:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmYZEm61d/xUpW7POorwVENrk6YKjRYURPSD66AqImI=;
 b=E5lIjOamTG/A6v1XpDgtK75dBX5Q+kbza2ojiC91ypRTYk0JrNJLY11AdeTqZ2AnC/
 QuUxZYR/lVyXeAmlqlz+vllJ91P2X/ahyL+aqo9q59MSV7kaJEPtGapWJ07pTrgL5wOB
 VUFGQ41pzETBdvoIVYUJMrG4sDbYmdN190hkyBzBcdSC8V9P9ryX9WvO1SnsleOZp2Ff
 kM4RH/JJ/hc7dcYkhrn26JSNXoadSZk5e6hpBIWv08qTQdBKzYIcchAEexLiZMTSZkm4
 dTYs1TRcwcz5n8rPVsANyQxrlmKQp+3/TzDjZivlVH2iD0d2ZyDFZwU61gczuAKvVRgn
 hRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmYZEm61d/xUpW7POorwVENrk6YKjRYURPSD66AqImI=;
 b=nq/XkCu441vzfcznlSVtDny69vKRX8tMk/d292ic5JhtEuuSNd432cJMBxiUM2Li/8
 qG2oy+Q3FvEiLxgqXBIAxFcSfgLBPMZubKgM6s0/PXJMkpAOHHrAe3c4IgOSlkviXgk1
 ng/3Qsem9hQxVYOI+FvVgQ4DGHWZwwYOVfymZvyKbK5pT41GGal+HfgS/ZWKmMbPG/cV
 GAoLf/ikGQZ/9THcuhUbGJVwo0pRQUbi72OEfbi+WUzq52BmmNjgxzjVvEhrVSzJjG5h
 ZqsEXVR0HKVKh6pP1kfrsRAYr7YyNjL1I9/fAd44li5biGrY1ZLBvGYN5h2RB3g6yW0+
 qtyg==
X-Gm-Message-State: AA+aEWaVdOL9Evw54it5ZOa62mDqNwsg9EGo4cAMAmbRhdv+qYuPltXR
 1hbnHV9yg1vkjG25jiCLpFf5W6eSiwOIa3xxk14=
X-Google-Smtp-Source: AFSGD/Xb9RFURUu0vvuiun64Zk4lRasUvU7K94TYVq7zNhxUQangIKI1Xs5kTg/h+kDCcU2DEXlRKgiY730MwNCr02c=
X-Received: by 2002:a24:80cc:: with SMTP id g195mr9378689itd.178.1544417390886; 
 Sun, 09 Dec 2018 20:49:50 -0800 (PST)
MIME-Version: 1.0
References: <tencent_042D1A75541F9448E7395CDBB86B1A011A09@qq.com>
In-Reply-To: <tencent_042D1A75541F9448E7395CDBB86B1A011A09@qq.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 10 Dec 2018 12:49:28 +0800
Message-ID: <CAARXrt=iJ1NEAWQnrXN=ravGufQ16hyjAErEUstLw4p=9Lw3mA@mail.gmail.com>
Subject: Re: Why OEM command can't run by "ipmitool -I lanplus"
To: 1450335857@qq.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2018 04:49:55 -0000

> On remote machine:
> xiuzhi@xiuzhi-ThinkPad-T450:~$ipmitool -I lanplus -H 192.168.200.132  -P 0penBmc raw 0x3a 0x11
> Unable to send RAW command (channel=0x0 netfn=0x3a lun=0x0 cmd=0x11 rsp=0xc1): Invalid command
> xiuzhi@xiuzhi-ThinkPad-T450:~$ ipmitool -I lanplus -H 192.168.200.132  -P 0penBmc raw 6 4
>  56 00
>
> Who can help me?

It looks like the plugin (assuming you implement the OEM command by plugin) is
only loaded in ipmid, but not in netipmid.
