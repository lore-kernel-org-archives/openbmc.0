Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="akquxtvj"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41sDZT4y31zDqm6
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 16:58:57 +1000 (AEST)
Received: by mail-qk0-x244.google.com with SMTP id 89-v6so287847qkp.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+AnDRQEMcQHUHvNPscrirtuDticAfUtC0ElV5CtpWMs=;
 b=akquxtvjRBgwvJexIo5jKgSg1ebAsBLIfiS28lloGiwr2E1He7LKHsikNI+c7LQXdW
 oReYWajEogOyyV2D3FyMch3icDrCrMrBzR70kDpBq7eNlAOnqj2BO9y5b1K2ygKunM9u
 QZpCSfvyXy8DG4W4BeocOIdLlMdM3qVXYTZ1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+AnDRQEMcQHUHvNPscrirtuDticAfUtC0ElV5CtpWMs=;
 b=QWeRrLJSinlREhPsiMM7l1mnXT0Aiz3T4ro9FAvx/skzRnEn3mG4IOaop4q8vWDuSj
 OEaZRgxj0LLkif/RHfKKiIgLzdYHr8wo9VFFBBHg9gZ4biYsv8BLiQOr9d0pYR33M7hm
 /gVK1hIBnpZD3Xutqi/bD/1DJE6L1ks+xXRigjAOY1Bs7QLzHg7hZ7pp8yZiA/fs19Z9
 B1S2dJJRVVoLQiAXOV2DteLh8kDvUnmLpyFYKk17ZOUmOy3qJXK9d4DeIGxiXqG2bveo
 +/tLBL8twB4WY+h/7ETAG/yFNC1agfGHz6FAyOg2ULCAsoch9PQ0em9N5MT6ZmOHFm/b
 QW6w==
X-Gm-Message-State: AOUpUlHLx0vH2BhnGXfd+jSdD8t0Xc+v63RLIoOX39b+OLBIP+Jsvqid
 zVbTbRSsrnq6unl0KvlxOqiv9xp6rIpR/AjPhDQ=
X-Google-Smtp-Source: AA+uWPzo7bjH3lf/JtJp2Csd3IGkNWsKuoSxInmdmtZT/avP/nxAbplgylHpsA4aeq+CprsPiycgDxYSUofBHncVB24=
X-Received: by 2002:a37:dd4e:: with SMTP id
 n75-v6mr29234613qki.370.1534489134124; 
 Thu, 16 Aug 2018 23:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
In-Reply-To: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Aug 2018 16:28:42 +0930
Message-ID: <CACPK8XfSDwVCJPCcTmNxi16LkR5RPHT8uOBxPGgcyE-PvTLcXg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 1/2] mtd: spi-nor: fix options for
 mx66l51235f
To: a.soldatov@yadro.com
Cc: linux-mtd@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 06:58:59 -0000

On Fri, 17 Aug 2018 at 00:30, Alexander Soldatov <a.soldatov@yadro.com> wrote:
>
> Currently in driver spi-nor there is a line for mx66l51235l.
> According to Macronix site there is no such part number.
> The chip detected as such is actually mx66l51235f.
>
> According to the datasheet for mx66l51235f,
> "The device default is in 24-bit address mode" (section 9-10).
> Hence we removed SPI_NOR_4B_OPCODES option with this commit.
>
> Cc: stable@vger.kernel.org
> Fixes: d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>

Tested-by: Joel Stanley <joel@jms.id.au>

Thanks for fixing this Alexander.

Cheers,

Joel
