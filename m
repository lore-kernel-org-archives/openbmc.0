Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 62B111A06A3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 17:28:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=EcZxmtGB; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=QrjUdeh0; 
 dkim-atps=neutral
Received: by oies66 with SMTP id s66so1179010oie.1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 23:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=PVMW0i6h0/7AHztZ38arq06R1m6mah7dlfnqA9b/SDQ=;
 b=EcZxmtGBX413Kksg59ggZbO0PPWaS9tzotZG4QICxYfCUs1IK6ONxJWiDc1yOWA2f9
 +m5tPDreRsXfeg2GrbrfexiWX6pm59L65gdR8G46Bk4CgTWEUCg2CB2z+TR/tyjihS1z
 Qm29etptSnZoCZP93vbgCV28pwBrBvdCnFpPAkGeuUimSR9PLhsV1Q6OIINbXnNugDTV
 3bXhKAfSnfu/HUyB1EuNQK8C5n8u8+CosSeSJ1RDIJltTXESH529afxLH/ZVxAIEZczz
 VAvmHJ4Zwv04tme7k1LDQDl8VDLyP1J9Hh8QGnoOLus99cMa5fX+t+hPlrdqSdFMjI94
 pbnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=PVMW0i6h0/7AHztZ38arq06R1m6mah7dlfnqA9b/SDQ=;
 b=QrjUdeh0MBpKN+1xGoNOEfz2DofUTISkhhJKHJAt2C/mugNMoTrnKx/tgdFAXg/mNN
 C9RwjbywBu+hn3rx02v2nDZK8lcwC9YSelhIm99z61mfphvOuu8cqRvNDig3c8gJQa5l
 dnjPsKM/wW0Gw9sccV7z0vuyS9Fd3GXX/lH5w=
X-Received: by 10.202.80.67 with SMTP id e64mr4277884oib.125.1444890534403;
 Wed, 14 Oct 2015 23:28:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Wed, 14 Oct 2015 23:28:35 -0700 (PDT)
In-Reply-To: <CACPK8XfPkYYpCyNMt5kg4tS5LuqXWHqvR6fos-zD3hkYxy+=8g@mail.gmail.com>
References: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
 <CACPK8Xc9sYaZLTZnHu3V2vQRB6PvO-pYR7uEappp+Mg0210NaQ@mail.gmail.com>
 <03B3DFA9-D275-433E-96E5-372E1DA6731D@bwbmail.net>
 <CACPK8XfPkYYpCyNMt5kg4tS5LuqXWHqvR6fos-zD3hkYxy+=8g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Oct 2015 16:58:35 +1030
X-Google-Sender-Auth: MXFYu4mNJL9Plc8H2H9GMhX8JfM
Message-ID: <CACPK8Xcusya1ctYwDoaP7daBZVZFB9-6UNPHLZ8sa+435REL3A@mail.gmail.com>
Subject: Re: BSP layers
To: Brad Bishop <brad@bwbmail.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 06:28:58 -0000

On Thu, Oct 15, 2015 at 4:28 PM, Joel Stanley <joel@jms.id.au> wrote:
> I've spent my afternoon trying to figure out how to get bitbake to
> build me an image that includes uboot and our openbmc kernel, without
> luck. Can you point out what changes I need to make?

Apologies. Your other email to the list mentioned how to do this:

rm -rf build/conf
TEMPLATECONF=meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf
. oe-init-build-env

I've added some basic instructions to the front page of our wiki for now.

 https://github.com/openbmc/openbmc/wiki

Cheers,

Joel
