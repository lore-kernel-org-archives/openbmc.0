Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TFJX83CD"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mmzb0kVjzF0dS
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 11:01:46 +1000 (AEST)
Received: by mail-qk0-x243.google.com with SMTP id 191-v6so5348134qki.13
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 18:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OPCnc6zfy45qna0HaeFllPTypYQfp5ZlATU6c4pfVv0=;
 b=TFJX83CDRPs+L4LgxAworGyh15mWtKnUFphmVO/GmZt6EooBw3Qiq8uprGi4OlkO26
 rEBE0JWoHtdHhV5xDvuM5L0PWhGBuFkSZvXri+QZKYmoISZiKKweGlsKMkpmuqCtlZCD
 Iy/UAUFJxixNfxBVHQ4dLV5xEDBJJInEcAeZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OPCnc6zfy45qna0HaeFllPTypYQfp5ZlATU6c4pfVv0=;
 b=G3qngPxm68Ls/YE8XqwlA2dxG7gE9d9nzu63hUl3Q2HKLSdYOBFJdgCeLQq1LIOCiE
 aXuxW++wz50ZynlS7gglDE004gFqCYNqGq2WHVxhg160nq0SrY+9aPFakna+lM5MG8YY
 qzoS+/f2+z6A8bhyIrljvKje6Zmwe0DBJxJfZLqWAArA1UvPmaRkfa3XUVvMXV7RvdNj
 QK87rrDbF0MbtBq4CX7cpi/TsWbsaeq6qcCESyIXN5D/YQcOvehZyh83eRggadmVCdR1
 smnAYTel9Q3igdTE2N26NOM6Q0nUoxemMKqeYDdJ9fXm0rBseV0O0lORa8oj2Q30vZXw
 qeiA==
X-Gm-Message-State: AOUpUlFzBQj0XuXQTfpHIoBE00y7SR/JkK8HEFP1EJrgFPhtF56W6/kg
 ZX13zQSnwWjjqMCAs5T2MudOK8NKqc2rpv6PboM=
X-Google-Smtp-Source: AA+uWPwXBWRKVjhwnTBNnNuIy314UIRJx+qbbvsharfZy7MEP6+zQkh/4BwLNUph8VwyxkkMNEz+AML/6KdCaOkXpjQ=
X-Received: by 2002:a37:9187:: with SMTP id
 t129-v6mr3962527qkd.112.1533862904437; 
 Thu, 09 Aug 2018 18:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAk-B=cSwWz3373eywPud3mQdBKCBMwb_iwuCcAwX9Udw@mail.gmail.com>
In-Reply-To: <CAG9c7cAk-B=cSwWz3373eywPud3mQdBKCBMwb_iwuCcAwX9Udw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Aug 2018 10:31:32 +0930
Message-ID: <CACPK8Xf1bDR_vPSDF7p1qW1cGjmjmRXSe2qdei9YMjKtqRHL8Q@mail.gmail.com>
Subject: Re: Patch files not apply while devtool modify linux-aspeed
To: Henbin Chang <henbinchang@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Eddie James <eajames.ibm@gmail.com>, Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 10 Aug 2018 01:01:48 -0000

Hello,

On Tue, 7 Aug 2018 at 11:13, Henbin Chang <henbinchang@gmail.com> wrote:
> We found the patch files would be applied while 'devtool modify linux-asp=
eed' after upgrade to Yocto 2.5.
> And show the below warning message.
>
> WARNING: SRC_URI is conditionally overridden in this recipe, thus several=
 devtool-override-* branches have been created, one for each override that =
makes changes to SRC_URI. It is recommended that you make changes to the de=
vtool branch first, then checkout and rebase each devtool-override-* branch=
 and update any unique patches there (duplicates on those branches will be =
ignored by devtool finish/update-recipe)

I do not use yocto when developing the kernel, so I can't help here. I
have cc'd some other developers that my have encountered this issue.

Cheers,

Joel
