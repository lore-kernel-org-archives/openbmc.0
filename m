Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDQTm1khvzDqGJ
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 14:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EdErOTuo"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id x84so280776oix.2
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 19:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=GlXpiZid6sghBzosu863uqEEMGvRd2YXUVf/LHBXAOQ=;
 b=EdErOTuoJoFUr1svTrCu1Lj86rDLxvGIn17a52XTOY6lYO+LkaGW2X+kCDuBRjwGHC
 LFfkmRZC/ThT105m4tsAZf0qpmQZ9kdCpA5AhxTV0xSKvqrWVN75Avhu7yp3fvRDUlc+
 eoK0Gx7bpszb/I3bi+W3aRxPkjSE9vM3yyDEJ3CxTR5dWq+Evp6QqxRkGCkFq1p0rY9h
 EHsoR5ljrImmD6ie7BK/TJwAahqFaX7dYep254WxD90PELunhyYVysL8KAj1Chyu28q+
 wlichTR/3btf48CAQlmFTxsRtjTx7av9aVmO4K5eeqVKOW0VUJCVfQPiXrDZIOoiU8a4
 ebbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=GlXpiZid6sghBzosu863uqEEMGvRd2YXUVf/LHBXAOQ=;
 b=hK7gW2LdhJSiQNM5KNqmUpot5A4s9gF2RXki4TuyjnOIXKibDnUDu5F7YqiastR4Vx
 ZqtuOCeeaTtEBjEsfJ1L02kiHTThahPxXpSdCGnkYWSbo+cIJRdATFf4Z2AuQPTN1BOW
 +AisLMoJ/9hZ0JZ7GFutPLDxKwDeUirzQsvZnXNUc2IAR0ENRqNc+/S7m1LtPgwYo9QA
 cujdDjyK8ARI4PDyDt+NVR5gccLw2Ws0Am8dzVEGg57Bw6QKkJqBy30VFz62nAxZegDu
 av5FZ+oluCRcd7CaYgTo0rs5zyf5hWDKcKdYw1+QA9JqEV+lnQEtR/lS62WLKo6R8vL7
 Fy9w==
X-Gm-Message-State: AIkVDXJVg/mbxtS76ADt1LuxBmLOKp2uZnDop7DUByhDreV3RNinV/J6ZsICxCOR0vi+7QSlZKzEjX0OAQAejA==
X-Received: by 10.202.180.213 with SMTP id d204mr3172986oif.82.1486006169240; 
 Wed, 01 Feb 2017 19:29:29 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Wed, 1 Feb 2017 19:29:08 -0800 (PST)
In-Reply-To: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Feb 2017 13:59:08 +1030
X-Google-Sender-Auth: VqCrWO2Bu9JTx6IleTuWIMpYD1U
Message-ID: <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
Subject: Re: Users of SBE FIFO kernel driver
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Alistair Popple <alistair@popple.id.au>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Thu, 02 Feb 2017 03:29:33 -0000

Hi Chris,

On Thu, Feb 2, 2017 at 5:58 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> I've not seen this discussed in the group but if this has already been
> determined than any pointers to the latest documentation would be
> appreciated.
>
> Who are all the potential users of the OpenBMC SBE FIFO device driver?   I
> understand it will need to export its general submit interface to other
> kernel drivers.  Only one I know of for sure would be the OCC driver Eddie
> James is working on.

In addition to Eddie's driver, in userspace we will have the code that
performs the power on sequence.

> Any others?
>
> What about user space access of the SBE FIFO engine?  What apps would
> require it?  Cronus I assume will need some means to directly access it.

We want userspace API and an in-kernel API.

The driver you design will need to take into account that there will
be multiple users from each of these APIs. For instance, there will be
Eddie's OCC hwmon driver and the userspace code that kicks off the
boot sequence.

Cheers,

Joel
