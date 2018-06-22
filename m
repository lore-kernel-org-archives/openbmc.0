Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c05::22b; helo=mail-yw0-x22b.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="etNJKhlJ"; 
 dkim-atps=neutral
Received: from mail-yw0-x22b.google.com (mail-yw0-x22b.google.com
 [IPv6:2607:f8b0:4002:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41C9Xf5DjJzF132
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jun 2018 06:44:18 +1000 (AEST)
Received: by mail-yw0-x22b.google.com with SMTP id u124-v6so2842944ywg.0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 13:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=w5ZTXc82HTMX5jOsm04ikZbbhcwMmJ8u66R8KlYN9Ms=;
 b=etNJKhlJWQK9uWC5vi0D+bJ+KkD0LO7yH9uWkGIBlgwI5QKnGsm/jnRh2yAMTiz6z4
 iuyymXEsJlMMfgwNdOFuLtfcEygpoZJJC2UyR/vgmqryDXaNw7V8FJikCwAu5BTcmn1p
 nX1gXp9fvOJuvjiqYtfUW/OnazcjiujQ/nb1ObdvovSimqelr/8ianNSkunfSuDTrmUV
 zf84NvqOM1nXSury42qekNQvXMAxY1KvrIMyE7fbY5IJmSXK4bcGnrJdurApbhoWdpI7
 sI1gOPT+hW72Esl4xPB3Emi/w6/wNYIHw+BAHNay8rvGRUWei+4xF5GTMj7mtDnWQRw0
 U77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=w5ZTXc82HTMX5jOsm04ikZbbhcwMmJ8u66R8KlYN9Ms=;
 b=mxPcza9y0fQk3j9xRB/EftDaXniAtifdTwF+Pg8cE3uQutI87ZYF2JdIPWh/hArjPI
 rzPOKxniLREoWq9bH0SM26dMDDWW5nbUsuJUXGrfO3oY8nmo948FF8Bum92lGHwRjKSL
 vcIS7MbklOAiE1tztmEQykUcFM4Kh/rZr7NOCWkbBSrc5t0kzCSdxS+giUerUuzpHi1F
 nRTlkPmsuR4yVO0wEeXS1Dlr6tc7MFtFbh07+Do5F/I9oWAhcypEaQeAVUKoPGUAKHV6
 ikuR64yBVkpyzpFpLBW/ZHqXI4IePRHdYgRFL0qIiWdlgqgeU7qypa/FISac8HqAXFP8
 qn7w==
X-Gm-Message-State: APt69E3702NBqqaCC1S+4yAqPFDgkAWx5dlmTHGk1ndC2D2Qyvg2Y+KP
 8sXwETZDV1/mPbXbwcqE/3e1EHlxUo6UepEq6d/upOWV
X-Google-Smtp-Source: ADUXVKJjmsS+I4lz3MQjb6LVCTookv0VvxBbjo+R3jle8YnvpoJmQaSlGM3fsIgkL8FxtzPo39HeGIJxQnF8GaYYRek=
X-Received: by 2002:a81:910a:: with SMTP id
 i10-v6mr1545980ywg.369.1529700255647; 
 Fri, 22 Jun 2018 13:44:15 -0700 (PDT)
MIME-Version: 1.0
From: James Mihm <james.mihm@gmail.com>
Date: Fri, 22 Jun 2018 13:43:39 -0700
Message-ID: <CADy_Pt3bCA=_6dKg5CNpPaYcBkW00_fVjUurD3=rg=mfEjRWVQ@mail.gmail.com>
Subject: Hackathon Date Change to October 9th - 11th, 2018
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 22 Jun 2018 20:44:19 -0000

The voting is in, and the winning date is October 9th.

Event:  OpenBMC Hackathon hosted by Intel

NEW Date:  October 9th =E2=80=93 11th, 2018

Location:  Intel Corporation
                 Jones Farm Campus =E2=80=93 Building 5   (JF5)
                 2111 NE 25th Ave,
                 Hillsboro, Oregon  97124

                 Entrance to JF5:  NE Jones Farm Parkway and NE 15th
Ave., Hillsboro, Oregon, 97124

Please join us for the second OpenBMC Hackathon at Intel in Hillsboro,
Oregon, USA.

This is an opportunity for the OpenBMC community to meet the awesome
engineers from the openbmc community, network, work on code,
brainstorm, and solve problems.

Watch for an eInvite and registration page. Register early as there
will be limited seating due to space constraints.
