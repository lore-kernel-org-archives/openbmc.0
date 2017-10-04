Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MVQIpAqI"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6NGP66ZGzDqks
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 15:29:33 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id p184so11713892lfe.12
 for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2017 21:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=n4yCIT6VnQ0nqaZPCS3Twa8WFCPUOLMtZ+mQuhZvZxc=;
 b=MVQIpAqIsam3glWuk7/Db8mxQ5tIA2AAoYQ5DPE2VGHx0nb+59w2C9B4rW/zOwoivO
 +EMh3DUlqZ5nY2lqjmMTmYCpyixRaoGO8krSK+9YCgjzRO222yHArvjiKY1oL6Btopkn
 SP+0g8DWUC4FF+UqS1WVTwDqH3oekZUxeYycWipJs6O6xYW/PQYN+fTWmheLsr6qOWL7
 vRm7qJWF4z/8zUBSD8lV92DIHzEbL7m2vNg3F/nIUdKmIRW4giFBgc+bSbOJWL1/mLjC
 EXbiY8a1JOveMT2Q+8xylE7DlSV/r6CQkTwxEKfCGP73xVq++bVpbuJ3bGN+Mof4DT2Y
 gKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=n4yCIT6VnQ0nqaZPCS3Twa8WFCPUOLMtZ+mQuhZvZxc=;
 b=o4A0By+Gz/xFpTZnzaddd/aGtcnvALxXiSZf4AJFGKL0jmCj+k+TQRhzJYpxxExOBw
 OFVH90p/9fHeGYhTOrTCDPLlttum/WIDi1Et/GLHNvQJH10hhdw5uCqh6rctAXnZYdlv
 eRAGQe9XjWlq6pQB56T5BmIlm9wPsKJm0gghY7vChc2wYRcsPyuMwG338jAQEJZIXWNf
 wcAgOCm8pLBg+50k+oi8fKakeReaqioGvG8qaeUdM0J48qDPU12230QWryvnr+RUH4Ec
 nepY7wHXPj04wJTlZrFjMHHmKFI0QD0TpU3mlKHDz6EJAiTlkGdo6TcUjpo8eCzkMitM
 sfrg==
X-Gm-Message-State: AMCzsaVMLfTJjQHVAchSDsv5tgikVtYUqDpRgXOm22A6eDV8QfpduY02
 hQp7YNxs4mV6AQSBnBIEImIG1hSGJo14H94cWVSpT6/28ME=
X-Google-Smtp-Source: AOwi7QBO4igG49+pycYWDzEL96FYlbYBx92/BS4Q9mLjoPX+THLrEbrQbDEKWmp7BvxH8b4Vm1rI9eq8sXyQgs9dbB0=
X-Received: by 10.25.233.81 with SMTP id g78mr1981234lfh.197.1507091370768;
 Tue, 03 Oct 2017 21:29:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Tue, 3 Oct 2017 21:29:10 -0700 (PDT)
In-Reply-To: <63c856a0-028e-4559-d85b-5fee21bbe426@linux.vnet.ibm.com>
References: <1506990743-1455-1-git-send-email-jk@ozlabs.org>
 <63c856a0-028e-4559-d85b-5fee21bbe426@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Oct 2017 13:59:10 +0930
X-Google-Sender-Auth: qxgOBFGXJ2am-ATCctIs5iA5kiw
Message-ID: <CACPK8XfCskZb1X2NcW+_K0OievMxL=rroOjtLRS3KLwggjoATQ@mail.gmail.com>
Subject: Re: [PATCH] fsi/master: Clarify master lifetimes & fix use-after-free
 in hub master
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2017 04:29:34 -0000

On Tue, Oct 3, 2017 at 10:41 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> On 10/2/17 7:32 PM, Jeremy Kerr wrote:
>>
>> Once we call fsi_master_unregister, the core will put_device,
>> potentially freeing the hub master. This change adds a comment
>> explaining the lifetime of an allocated fsi_master.
>>
>> We then add a reference from the driver to the hub master, so it stays
>> around until we've finished ->remove().
>>
>> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Tested-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Applied to dev-4.10.

We should also create a tree with these fixes for upstream inclusion.

Cheers,

Joel
