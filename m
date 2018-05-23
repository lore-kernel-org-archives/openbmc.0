Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::236; helo=mail-pg0-x236.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BxJ6PJBM"; 
 dkim-atps=neutral
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rQK219qmzF0dm
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 18:14:13 +1000 (AEST)
Received: by mail-pg0-x236.google.com with SMTP id p8-v6so9060961pgq.10
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 01:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Fz2TjTflnjxFi+VnnNXu670RFs+nkemjGfWgbpmvVWk=;
 b=BxJ6PJBMj9vYy26G02l4IWvOSXTcODkP+4Ba8CSMn15VwuX+rBYSfs9iJfXodgqvK5
 3ginIaUyuo4vDFCsPmJKlTR8faTGn6n2/WYpV0GMcBNokBt/FDsFrPHaya6QnT1JyQ/7
 doAjaXYhnJa2g4s4uEAliR+BKxEQClbRQZ8sPonqrWwcaW1z4o8WVPdN/lgcOAHvdMyy
 81xkIl892gbd+3lfluzjoLG55PmRBLjaSKsvl2AyjzaBPQRsfOZ9ToSMzis3abahwj/F
 92eSTfNa8xRKGrWMLBDDSIwbLZ9kQBVVgBan5FJUuAlkC+6pO7LkJE8P9ljHurzOzib5
 3VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Fz2TjTflnjxFi+VnnNXu670RFs+nkemjGfWgbpmvVWk=;
 b=Mk4Zyudmnhc9rvShVSwwEVdnAvUGaTLhgcnD5pxcf5k/38u4y+xKzW9KalAfU0WMTA
 phcHEtugkUuaqeVgjM+s6Wu6K1tvMLNIVLQ70KtCItvybS1VbgeqDbRY7LS6j6vqUcdt
 jK7dszQfDBluuM0cXNl4+iRd3yMcQNs+3ifTtYQKJd2t6xvVftEbUR4XE1LT+lguU0qF
 9b090x9aGmTT+g9hWDsqMCGi5hre5fqfQS0GEvgVA+dTr9yupWJadsDjzX+Ya5G4EJDv
 Ji/Wr7oN0WSVcjn5lcie+TcK74M9BfvTqqSYBi9VVuNtF5BN0Yj6RABNHPdt1zA16Lga
 FOcg==
X-Gm-Message-State: ALKqPwd0n/kvC8wTWXGA2we21MntXHFqFt3vCCA1FHQx5s2ZVA0AHuYG
 oO6as97IyiVV8J3e9dywEMx0K+Cy
X-Google-Smtp-Source: AB8JxZoBFRnGavREznAHaMY5cYgtyoZEWr+5HxFSHZIni+aZt+Il81gFD3FRrgJNRD+QPYbx2PfWHA==
X-Received: by 2002:a65:6119:: with SMTP id
 z25-v6mr1516808pgu.139.1527063251138; 
 Wed, 23 May 2018 01:14:11 -0700 (PDT)
Received: from [192.168.1.2] ([220.130.36.2])
 by smtp.gmail.com with ESMTPSA id h191-v6sm26578355pgc.11.2018.05.23.01.14.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 May 2018 01:14:10 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: Re: How to power on Intel x86 based CPUs
From: Brad Chou <chou.brad@gmail.com>
In-Reply-To: <000401d3f253$8385fcc0$8a91f640$@linux.intel.com>
Date: Wed, 23 May 2018 16:14:07 +0800
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <15BA9EDB-FC83-4F71-BA87-676B0943550A@gmail.com>
References: <000401d3f253$8385fcc0$8a91f640$@linux.intel.com>
To: Yong Li <yong.b.li@linux.intel.com>
X-Mailer: Apple Mail (2.3445.6.18)
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
X-List-Received-Date: Wed, 23 May 2018 08:14:14 -0000

Hi Yong,
Great, this is a good news.
I am using GPIO scripts to control CPU on/off in chassis services as =
Quanta-q71L does.
So I can just power on/off it by systemctl commands.
It is more preferred to use D-bus interface, so maybe I can also use =
REST to do power control stuff.
Thanks.


> On May 23, 2018, at 13:04, Yong Li <yong.b.li@linux.intel.com> wrote:
>=20
> Hi Brad,
>=20
> We(Intel) finished chassis/power control based on sdbusplus for Intel
> platforms, and starting to upstream.=20
> Official release will be available in github soon.
>=20
> Thanks,
> Yong Li
> <winmail.dat>
