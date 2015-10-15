Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22d.google.com (mail-oi0-x22d.google.com
 [IPv6:2607:f8b0:4003:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B06261A039A
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 16:59:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SWneYRJx; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=JEenMzTi; 
 dkim-atps=neutral
Received: by oiar126 with SMTP id r126so40488980oia.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 22:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type:content-transfer-encoding;
 bh=vE+KbbY8rzJBuny6BYFnr8DbwydcAGSsC7VCCWleufI=;
 b=SWneYRJxvTNdJAGNDcoz/EkW3ptNq4NAaIclXPBzWbwc+HZ59enWmaThaPmG+0gHN8
 UHNCaQNCmbyAv8soXIxP36oGb4lpXBTQ5CGRMOy9s7rFzUKjPF/6i+fM8Gqe2fuOe+y3
 6H+/C1vkCQd8+3yDGAaKFA2d0wTi180BCqcLwIxE9QOMKlRnLALKG2QV/9W0ZpnNUWk3
 Pn0RwiaIN0vlGY0R2lJHxHd9UVwFRneFtzIf7hYUhWn66zOZYLem+vWoIBCMgFcvK/WP
 Uqk0PW9y2hym2DS1qiCzoPvkGYbFUnaINX/ylA7xKMkkXUCsK3tpZE/C9/TFTVuf61jI
 sWnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type:content-transfer-encoding;
 bh=vE+KbbY8rzJBuny6BYFnr8DbwydcAGSsC7VCCWleufI=;
 b=JEenMzTi28lbG2kzt2qKmKzGJUBvXKV84cs7Q13+tj1a1pScnj10FJj8NjVChGLnWV
 Ai8ApDZHCBE4hoMwXFKzbaI9VxUePnS4mD4mJZLC2HD3ympPSu/8F96gEV4Fu9Ua1Gjp
 M4Mss+XkN1BOKpaJKKWg9bBINw37LSU7bySr0=
X-Received: by 10.202.232.12 with SMTP id f12mr3849234oih.122.1444888738794;
 Wed, 14 Oct 2015 22:58:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Wed, 14 Oct 2015 22:58:39 -0700 (PDT)
In-Reply-To: <03B3DFA9-D275-433E-96E5-372E1DA6731D@bwbmail.net>
References: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
 <CACPK8Xc9sYaZLTZnHu3V2vQRB6PvO-pYR7uEappp+Mg0210NaQ@mail.gmail.com>
 <03B3DFA9-D275-433E-96E5-372E1DA6731D@bwbmail.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Oct 2015 16:28:39 +1030
X-Google-Sender-Auth: Nee3QGCtsAo9-hGtJy0Ar6zpf4k
Message-ID: <CACPK8XfPkYYpCyNMt5kg4tS5LuqXWHqvR6fos-zD3hkYxy+=8g@mail.gmail.com>
Subject: Re: BSP layers
To: Brad Bishop <brad@bwbmail.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 15 Oct 2015 05:59:01 -0000

Hi Brad,

On Thu, Oct 1, 2015 at 9:32 AM, Brad Bishop <brad@bwbmail.net> wrote:
> Thx for the review.  I=E2=80=99m trying to get to a point where we can bo=
ot a Palmetto with these in the next few days.  I will follow up with anoth=
er note.

I've spent my afternoon trying to figure out how to get bitbake to
build me an image that includes uboot and our openbmc kernel, without
luck. Can you point out what changes I need to make?

I'm at "ca82111 Merge pull request #16 from bradbishop/master".

Cheers,

Joel
