Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::236; helo=mail-qt0-x236.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ijgSPB6y"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="MIqD9w1S"; 
 dkim-atps=neutral
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RNvL4wHQzF1v3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 12:57:34 +1000 (AEST)
Received: by mail-qt0-x236.google.com with SMTP id w12-v6so4066788qti.4
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 19:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=52Ko3CfWjEyaGPo0JNzOCxtxf0zvVboMXsrTxkrvsVA=;
 b=ijgSPB6yVi7JDVkJjxBKS7WaX+qvALWVj9i+TOHjwgvwdsFWtJYOg1RVvxPfslLyLK
 z0f7uQAjUJ1Z/wo9uqZb2XZ+u5sVjiaACZOGobOrKPZntzvtlaNJcbz+sqJNjsTKjG8i
 cMItfdb5gTi9sHRwn9bUe53DimJ0+RWL0hA18BAk4xbnuP/f/RMnDPm+No/9M8Y4cP4v
 rUpmSwi+oDl7gEzieYNRStj6tyGj7In2LVTKiPrxHFgpHKsM1JXMYXyJMx3YPdco9AMJ
 mfDEziug3XCvyw/h1hfBlH/P7tsaLJCPjPbSqblVSJmnpmgc+13CF46li6Hyk+80HQ0o
 OvZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=52Ko3CfWjEyaGPo0JNzOCxtxf0zvVboMXsrTxkrvsVA=;
 b=MIqD9w1SDn4Wl1pcEngyV0JH/LhW7/CXQTPIiLvvY+x3IMbB6Jto4gOiK2Qo7svIQB
 jobLgOAHcMOcsF8+AS8LRycEnnhIsSoFAXRJVLndEQ9adT+hnzQLD8yZf+r1DX9GDYIR
 AXkIij2xFVfFg2Nhfi0N7GEMsnCKTWSRqmDNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=52Ko3CfWjEyaGPo0JNzOCxtxf0zvVboMXsrTxkrvsVA=;
 b=ChCW5cu6Owsj0YRyAUC4yFRaV2ENwEZGdHA7MWqbOaDj7O658sYHyjhujhU85hMtWJ
 /iG4uBBila840L7IiMBxv8Mlmh3wZgjvCwAteUFnIb96+AqEeVuW7BGQBh9zu3gSTeBJ
 RSgZ+VTaT+kYg7lc05sJuMvgL5+h344UFHiCgpcYJYBs34otlaL8+Xvyh0gpMFeuTn98
 +nItuy44jDXYruzGB3O9hkx/PORYsJbe2y4amCbn7BcUV2lLpeYs1xN1iJ2oSce8+aDO
 eD64C778kyntof6bhu8PmRzKFi7wmQVmODhBv6/oru/xgKEl+zMweYENaDadFBELce2v
 NFyA==
X-Gm-Message-State: ALQs6tCbrNqS+5DQTr/fXWq8RY0rRa+CRHCPw+6MzmXIfVy6yEZHxzmI
 2hDsRZsJr8F5bQnvLypaGJHzFxqhmiN5dAGu0G8=
X-Google-Smtp-Source: AB8JxZpvC9q5iQyHHmzApUq3oYNJA8WRHM3ESkKoj3rrgVN71PWXhFyupFXe68Qn4zljGxBlEOUk4bWrIA9XCyQ00OU=
X-Received: by 2002:ac8:684:: with SMTP id f4-v6mr4310976qth.306.1524106650623; 
 Wed, 18 Apr 2018 19:57:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 18 Apr 2018 19:57:10 -0700 (PDT)
In-Reply-To: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
References: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Apr 2018 12:27:10 +0930
X-Google-Sender-Auth: b1jBCI1AoY_dsfYgwTSEcltOdOM
Message-ID: <CACPK8Xcpvyp6kAs4CNLv+vCAu6hJnQ5iRpU4Je=Ehcn4NYNQ=A@mail.gmail.com>
Subject: Re: OpenBMC v2.2
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 02:57:35 -0000

On 19 April 2018 at 10:53, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> There has been lots of cool work in the last couple months and we=E2=80=
=99ve been
> reasonably stable with Yocto 2.4 and Linux 4.13 for some time now so lets
> have a tag!
>
> Last time I mentioned v2.1 might be the last tag before switching to some
> new branch strategy, but nothing has happened on that front.  So like
> before,
> stay tuned to the list for updates.

Cool. As someone who sees these numbers as a user (tech support
person) of openbmc more than a developer, I would like to see them
continue. In the past I suggested every six weeks, as it gives fast
feedback of "this is old" or "this is new" (or "wow OpenBMC has moved
on a lot since I booted it last").

Cheers,

Joel
