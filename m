Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SbGFdHCj"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Kjg56vbqzDr6q
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 13:12:49 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id l7-v6so22174914iok.6
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 20:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n5rTcTXZhheCpoys1yKzyZCi3fyXNIS+GjD0vK2bj0E=;
 b=SbGFdHCjHoa3QJPcopLmvN4VbZazQORgMkqppK2cNCuHr+f4qjODviPtP7CrNVf0Tj
 vey/nGJjFL+5Xls47vsjThiAEQLALQxrsYEa0Ie4hUINVPMjckPpjmF0hQ+ATzFzF14l
 Iq5HMz8sTjR6msloQhbAF4n6LIftl8Qv5Jv4yH87U0095WiUXOXsOBl4jryhnrTJRCF5
 oVgi9A355c0ryEVDLyDHlS9ce6TDCbcw/AFW2hrrUzzSwabTe40rMN5d4YvJ/7eGf42l
 SRvCqvqTcMsGI5sAuw57CDjKYgg1myMXS7hOt3XZ71fmCSF7o8dRy0ucpO21LPw/aAH4
 phSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n5rTcTXZhheCpoys1yKzyZCi3fyXNIS+GjD0vK2bj0E=;
 b=F1c8fve3MxDwEcHRq/62ukbYXUtczgP5BE+L9XpZM5oVoCWRKQouzgE27xu47Qij5z
 g6QCyGuiAmirIzi9AhKFWy8i6mQgYeILH3ylX1dlxDrzX9EFUcMa1y+Lp6EMOSh8zc+Y
 /ODiJZ4qcj2QyDfx3Xa6lqt65cCtufFUvV01doU13AidPJ9EFL9siNb6At1xjjkoYMAL
 7wNwVAopkgNEkNzd64vt9nCtsA+O0xLGyWzOaJ0d9Pxe8yCvdrv2KXzG5vGCvWZ4E2OS
 tBGiJksD6GHXpeFphXwKpa7s4IBpcJOTvdnAU7eWj8UMxHMh3iFVZo3rABjW0wcpttpG
 NiDg==
X-Gm-Message-State: ABuFfojBae9dwz5yJB9ovOQ4vBfK+BMp25n+yAz9kccpuQN7leLuoukI
 t3mM6QNRkKfw+UczOFMGbSgvgp2NrbRZmS91CzY=
X-Google-Smtp-Source: ACcGV62ycQ3tmsCHtBytrWcBbsrxG8GYMIdVdRhNNuHh3HK4RPpgIUWSa8EdyzQrSyE6AbenrHz+9J91WA/6ftSCHxE=
X-Received: by 2002:a6b:bf86:: with SMTP id
 p128-v6mr3380241iof.156.1537931566998; 
 Tue, 25 Sep 2018 20:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR01MB40382A2AF6BB37B46FD74C1CCF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM6PR01MB40382A2AF6BB37B46FD74C1CCF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Sep 2018 11:12:33 +0800
Message-ID: <CAARXrtmyz50-LrWh2UpfiPWuPLB3djkiKZUHFwfDhiN7qkEQ1A@mail.gmail.com>
Subject: Re: Question on flashing firmware and bmc image
To: pietro.maltoni@studio.unibo.it
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, a.bartolini@unibo.it
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
X-List-Received-Date: Wed, 26 Sep 2018 03:12:51 -0000

The questions in the mail does not reflect to the title, hope you could use a
more specific title.

On Wed, Sep 26, 2018 at 7:53 AM Pietro Maltoni
<pietro.maltoni@studio.unibo.it> wrote:

> After installing it I've recognized that oem openpower commands and sensors are not available.
>
> For instance when doing ipmitool sdr elist I do not see openpower sensors(occ ones) as well as netfn in ipmi does not contain commands for the occ.

What is the revision of your build?
The ipmi related configs are not complete for Palmetto, and there is a
[recent commit][1] to add part of the sensors for ipmi.
With the commit, ipmi sdr elist works ok.
If you are looking to adding more sensors, patches are welcome!

And what do you mean by "netfn in ipmi does not contain commands for the occ"?

>
> By searching on the code I've recognized that these are in meta-openpower recipes. How can i enable them? Is there a standard procedure for enabling them on openpower hardware or in palmetto?

Please refer to the below link as an example of ipmi config for Palmetto's
sensors.


[1]: https://github.com/openbmc/openbmc/commit/f47fb7cf87e6d69132f4ca101206dbf091097027#diff-d90eaa8cd7210f2f005894b7f7001d9d
