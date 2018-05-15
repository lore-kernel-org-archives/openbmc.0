Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::232; helo=mail-it0-x232.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qhi9FR+e"; 
 dkim-atps=neutral
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lLXR40zJzF39w
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 12:06:31 +1000 (AEST)
Received: by mail-it0-x232.google.com with SMTP id j186-v6so16220964ita.5
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 19:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=X69CAZlchE1QLq6RCgzoY5Hetl40926cwQr0X4GS6hs=;
 b=Qhi9FR+eEBMfNREAqr6SRoLEoouAz01ovDjbTM7JgtrOFfr0pyJAiGJQrGUAtvFSAn
 RXyuTraFnMPvvtO+vNSyL4hfxv9yYvu7T1w0xDwgwM2FW514kSjtogRl2hN2ix2z4tmn
 AQGhptPlcGaVyiqItV/c10GTuEervCY0DZZeORDxVGFjJUQyc+LXBc9V6ADmzXDZ6eln
 CRcoAgeVMMvW3rEy47spVmYThLk+7t+yTE1WJvHcntTXcV9tzIjLYLCtfEEP84shJJKJ
 wFLBm592gzKca0Sh9s4GLFOJThl9+uLYO+yegb23B0CDjRaVcMdqyfPgBLbF1uFMgvsR
 EVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=X69CAZlchE1QLq6RCgzoY5Hetl40926cwQr0X4GS6hs=;
 b=E+xMM9BY+e9N58DymHu3LFbl/XxGgcdoWlH/RdVJTBzgaIxwTG6XeFAJW4Tb3qnrCu
 K2MbsqgfsPwb/K++CalItMP34HQgRAjTBHlJ3dFBtTr67EUllSUn2QB0mmyzrlLO/rcY
 FiMAIFQ6P/R9YYEJBkOfDXruetq8aquEiabMWdJZXFhecJlA7gCy5HsDj2sQVk/HTtSe
 OWXRpHG3UPfNAryhNkY+UKAq+sWYXyTAGKpkNTMlGAIS+OJUwygGRQX66lzIU9xNxye5
 Mj/yWQZBjmHdOPkfjZqwJy6H+h2IhdP5qk7KSiTW4BeEoPQR4hKywjEDSYlSbell4P83
 gp7w==
X-Gm-Message-State: ALKqPwcIqkajguAId8g51Us+9IPk4R+J+TQVLxq39j3iwHAgRCZZbvgW
 N+dtT9u/uQHLkqmRx5mAT7UbK6fIMoD+3/aDl2MLVIIo
X-Google-Smtp-Source: AB8JxZoWaJDoerDkMqWOVEcIJSmbhsZaUVJzHnFfKM0tybfZ5NsauW11fsbvfIl0NjjicbSSnvfkIMDLhXtgChRe1v8=
X-Received: by 2002:a24:8d85:: with SMTP id
 w127-v6mr11542652itd.22.1526349989309; 
 Mon, 14 May 2018 19:06:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Mon, 14 May 2018 19:06:28
 -0700 (PDT)
In-Reply-To: <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 15 May 2018 10:06:28 +0800
Message-ID: <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 15 May 2018 02:06:32 -0000

I'd like to bring this topic again.

As I know image signing feature is completed for both BMC and PNOR:
https://github.com/openbmc/phosphor-bmc-code-mgmt
https://github.com/openbmc/openpower-pnor-code-mgmt

However, the above repos are only for systems with UBI-FS feature.
Most of machines are still using the "legacy" obmc flash layout, and thus
they do not have image singing feature.

So I would like to ask for ideas about how to support image signing feature
for machines with "legacy" flash layout?
1. Should we use UBI-FS for machines that requires image signing feature?
2. Or should we implement image signing feature on "legacy" flash layout as
well?

Thanks!
