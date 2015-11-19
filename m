Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22c.google.com (mail-oi0-x22c.google.com
 [IPv6:2607:f8b0:4003:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 91A1F1A0352
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 15:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GEmt3QsJ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=T2IMsrdR; 
 dkim-atps=neutral
Received: by oige206 with SMTP id e206so38040801oig.2
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 20:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=y5GYvc4mKW76eGg6pJDpxyIrfY5Mt65k8qGK+XsDo5k=;
 b=GEmt3QsJoIPssHZ+Q21CEFSzjdIqzUMBk6P6bfoD2FfMIzQO1ev+QU48recTLJHMTy
 34F4qbh3ERlWp3X8/YWhwOLjVvWtNP6pTH87nYjsdr+BE1ICGfyDVkhrozlfekcKo9CG
 fs5kpSMZu6Y6T6q1iImvm50Y3cH/CfOnzKEnrd9+xdmqxN+LDhcDGvqnbmGFPQHptmMQ
 aKqIdcU1yRd4FgWowQaM67dAmjOmOkmT2srMTlxvuc2xD+B94ioIYTQjAy4LIPqTOl4l
 bDJFMAthJkd/vvIxUFAocAOE20rKHp1eVfo7P4AB9NT9fV8znqBK3J6sOp/d1J5J0H82
 ZYCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=y5GYvc4mKW76eGg6pJDpxyIrfY5Mt65k8qGK+XsDo5k=;
 b=T2IMsrdR2jkMDhEubE05YMddZeJhA414DFMPnY6mEH+gVeW1kKlaN+dE5fGH3dYjGG
 Uy8yT6yPk+prwIBLPiAvVERQ5WFwn8teq9l5ydRa3hOYMGB584xY8TDh+xfM66k8g0yG
 YV+TYPJQT75D08wt4WBDnZrLASBwigOe8ZyDQ=
X-Received: by 10.202.206.130 with SMTP id e124mr3372552oig.132.1447906192274; 
 Wed, 18 Nov 2015 20:09:52 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.226.10 with HTTP; Wed, 18 Nov 2015 20:09:32 -0800 (PST)
In-Reply-To: <8AE72D0A-C340-4F18-A06C-E0907893B453@fuzziesquirrel.com>
References: <1447821019-21779-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1447821019-21779-2-git-send-email-openbmc-patches@stwcx.xyz>
 <8AE72D0A-C340-4F18-A06C-E0907893B453@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Nov 2015 14:39:32 +1030
X-Google-Sender-Auth: 6HANO6z2tUiTxTDnY2MAYD11jm8
Message-ID: <CACPK8XdERZ59uZvAT87Ut3=Ae4diCp+o6dcdb8r0P432hv57gg@mail.gmail.com>
Subject: Re: [PATCH openbmc] meta-phosphor: Update kernel version
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Nov 2015 04:09:55 -0000

On Thu, Nov 19, 2015 at 1:38 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Should this be 4.3 ?

Yes, good catch.

I'm not sure how necessary these strings are. I'll take a close look
at the bitbake recipe.

Cheers,

Joel
