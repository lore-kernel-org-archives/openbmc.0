Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ElfndXD5"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WTRS53hnzDqDx;
 Sat,  5 Jan 2019 02:36:52 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 40so32372571oth.4;
 Fri, 04 Jan 2019 07:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ftwpY3Kr/oa8+gzyuIL89suFgEAcz4cWVohwl6uAnDE=;
 b=ElfndXD5Az15ePy6/hks56PNFLlCMS+tGX8T1LixpKAbOL6AWaiTw0gJvsY/Nj3SJH
 aIy+mRfwLiUB/Rg5+TYuaVgbZRFRIZHjf5VGH1Z1HsyADpHtrwehcnOUoeclUKEZ8FYZ
 sFkhbvHSLB6P1We8+SSOVnK1MW9b8+Bx+GYeBys6FPEiyJjFr2PDD+Q/hytZfRajtV12
 ISnNW+hC0cbIXuGbFJafMOSyrEGHuaiEfEgMi3/u4XtNR9iuFJZf1XO+UBU96EmOmBfs
 Vi1bD0wAgTDXLnSFWtUqrgjgg89WiBg3V868+wJZCxLmmYhmiv0WGOrTzMO6yWo0bA8q
 Jgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftwpY3Kr/oa8+gzyuIL89suFgEAcz4cWVohwl6uAnDE=;
 b=dYYj+doYFSQO5ReOn+oV4iOtNX3WTukJiPsYoOfzQB3/80a6kOo0FOCvbSboNhKReR
 KRxXmZu2Isu/jNxEt4qmnvb6QmWpZ4t/tTBPGA0N5mT7AS1CxlQvDzxtuwCpmPbFRdMm
 KyX3ireabDr9a2Seu3p48rDdWRuWH11Zvb8mz7WQUsy72ZYOlN1390jGPdw0FjCWF/CF
 jbz20FzIYiSwCkixlGMczEkjUTVjSmUjTQpU8m+4D2PDXtJx2OF210Gii5r4iQRlx220
 eJQ68GNzYMRTv1AHz+6MKsgyuYm9vB8nV+xdiHZ6nq/VkdxP/rPELyKRFAoFPe30aZem
 V2Yg==
X-Gm-Message-State: AJcUukeEY80Mj7/mFXgYGLOqFg3df9LK6PxUvrhtYefMYFkI92hvHWTl
 9mVzzwR9RWk/heViXH6yyzuISsfuVL6LZAgE0n4=
X-Google-Smtp-Source: ALg8bN749bo8myLQDmf6EKYxyRq5W00pxxFjze5Dp2P9VQfAIldzZ9Au36LFXp3pXxmew0kkL1Z0n2Nz7jr/oXNN5Lo=
X-Received: by 2002:a9d:74c3:: with SMTP id a3mr37733272otl.107.1546616210202; 
 Fri, 04 Jan 2019 07:36:50 -0800 (PST)
MIME-Version: 1.0
References: <CAOSNvHqX_Yt0hAeUKq=E1h2cr06QLZaLv4NeZRkfiXV4wQf29w@mail.gmail.com>
 <2f609082be880fbf2df9d1a6279decd1@linux.vnet.ibm.com>
In-Reply-To: <2f609082be880fbf2df9d1a6279decd1@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 4 Jan 2019 09:36:34 -0600
Message-ID: <CALLMt=rPpq+G9+w1CpF2A9brJDGFysN45-Wr+t5tz9fKdty2uw@mail.gmail.com>
Subject: Re: Error in running SDK
To: jrey@linux.vnet.ibm.com
Cc: omkar.kuppa@sanmina.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org
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
X-List-Received-Date: Fri, 04 Jan 2019 15:36:53 -0000

On Fri, Jan 4, 2019 at 9:08 AM Joseph Reynolds <jrey@linux.vnet.ibm.com> wrote:
>
> On 2019-01-04 05:55, Omkar Kuppa wrote:
> > Hi all,
> > I'm trying to setup Development Environment [1] for openbmc. I'm using
> > linux (ubuntu 18.04) in virtual box for the setup. When I ran SDK
> > installer ( oecore-x86_64-armv6-toolchain-nodistro.0.sh [2]) the
> > following error is displayed.
> > "ERROR: INCOMPATIBLE SDK INSTALLER! YOUR HOST IS ARMV6L AND THIS SDK
> > WAS BUILT FOR X86_64 HOSTS"
> > Please suggest how to resolve this error.
>
> You could build the SDK from source.  See:
> https://github.com/openbmc/docs/blob/master/cheatsheet.md

Yeah, looks like you're running on an ARM based host. The SDK
up in jenkins is only good for x86 based hosts. You'll need to build
your own SDK per the directions from Joseph above.

>
> >
> > Thanks in advance,
> > Omkar
> > [...snip...]
> >
> > Links:
> > ------
> > [1]
> > https://github.com/openbmc/docs/blob/master/development/dev-environment.md
> > [2] http://oecore-x86_64-armv6-toolchain-nodistro.0.sh
>
