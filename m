Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNsLs5TrNzDqLS
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 22:08:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hnwE2ETm"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id l192so833968ybl.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rQrF3Q0+oFucPWmbs96eP6n9pdatdKdyQpelGHaPb1g=;
 b=hnwE2ETmMY0FjjTDSN+TIbzebkFM2wvsc08/Rb6FAv3f3621bx7ShcvCb59BOonKHH
 JyfAMntwR3iYUH304BoqOGQm7IggaFTEAKshZHcf4FUmgBFHUre9PAF5Ios0jEWGTLT+
 zimXVrSSte4NuFY/WYG/ZnS9v/5zQD5h/44DQDYy04TajLysoJ0NHqMpk78w55tm3g3J
 6cAg2mgihczIxUF054LI5k8TVtLv/Fj7DgHde2CJuNDqloK5+XdNh7Pg0OHWvUkyIFAU
 Ic3j7snlrimsZ2wQMBtRtUerSO56OHcknfcFl5l2HiXGZrWZwLOHYZTOFfVIjsTDzax5
 lkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rQrF3Q0+oFucPWmbs96eP6n9pdatdKdyQpelGHaPb1g=;
 b=F7hfYTGUVI7UCZiTMF4mB0GF/Xrv+b2NENnWJSRDPDU43c3qTR0z1Ml3bbEII6Tg0l
 Sac54NN1BaClv5/Ie6ByFLILk7afoys/b7y/AKX5DFfvAxB4o5OFNqegZ+NrmTAmJ8xQ
 RDLTnbs1Hc67m07EHRYNvJQWX65xeKJ4mG3zDye8FIUIDXslMz2WzAvJR8Ew1aVF3B4C
 pkF4xuCu24YXH/lhSafc+WcdAuAxFvq3pSG+ofOKrHT+k/pbcDx5ReKNQ8DyFYj15Aao
 0YXQ7RflAlbCvdQG0BlX9vNLr1zYP6G29ABaUPV0V7Udc7I/vISlj8PumPWWd4obPivH
 UzkA==
X-Gm-Message-State: AODbwcDa1+bnJuJOK/WIzPCCm2cw8hVhyWIjNdlf+J1pDHY156nW9JZE
 pa3NJ1qpUb7qpE/K5Z+rKPpxjiS/Dw==
X-Received: by 10.37.164.102 with SMTP id f93mr9135319ybi.152.1494504483563;
 Thu, 11 May 2017 05:08:03 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 11 May 2017 05:07:43 -0700 (PDT)
In-Reply-To: <20170509213902.37939-7-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
 <20170509213902.37939-7-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 May 2017 21:37:43 +0930
X-Google-Sender-Auth: r9n7fHNCRrNvFkm84Ykrw8rpQME
Message-ID: <CACPK8XcTJ+rRTjU1oHtQ8WPHc3SvHsMqZevjjdihc82saps4cA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 6/7] drivers/fsi: GPIO stability changes
 for Cronus/Hostboot
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 May 2017 12:08:06 -0000

On Wed, May 10, 2017 at 7:09 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Improve stability in the FSI protocol by re-ordering the clocking
> delays. Increase clocking delays to 3 microseconds.  Remove
> delay prior to sampling input - now redundant given new clocking
> delay order.
>
> New effective delay per clock toggle is now 6 microseconds.
> Previous clocking summed up to 3 nS but real time measurements
> of each 1 nS delay actually was approx 1.8 microseconds.
> Previous total delay was then 1.8 * 3 = 5.4 microseconds.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Applied to dev-4.10 with a note about this being a temporary fix until
we find the root cause.

Keep us updated with the investigation.

Cheers,

Joel
