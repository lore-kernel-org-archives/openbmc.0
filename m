Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rY5KF2jn7zDq66
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2016 19:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZHz+IAoP; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id a186so154176607qkf.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2016 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4tjGCCpvCZVuiat0U1kb5TITdg+JV3Kw6lgfMDFzBxo=;
 b=ZHz+IAoPgiyNfW1VK2698PY8sKLp29Eb+98pmv46HdVo0S3jzpXmahv1ifFx2S9yHM
 rjec911D6N/uUFYSDz3e1UfUBmq7NtcUkxqHNYYdMsh4HII40z7o2Fsa8tH5VGwOFAyz
 CRW3Fp5RA8gzNCy1wfIsr1xnBdAcco7eTiqLt3sLkXgMZJYwe6Y2/qxf5nus1dv5ufes
 vq4u+t/b/qzt/62fb8QkKR3woir12YVomFVD3jGovuKtnF1HSGc5+wtz1mV6XUR5Tmp/
 MCqo7dM5czuM0aNShcpsaLIqCcgL0QniqoLXAkktq8JSdhgKAoqDSAFky5CWNNVkAnnf
 30kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4tjGCCpvCZVuiat0U1kb5TITdg+JV3Kw6lgfMDFzBxo=;
 b=bC8gS7ytiSf8q70uL2RtUlFYF1GVdzyWtVtivNx9ZQbZI69wdVfBUvzJ/tNcjtJHcx
 Eb/5WHUsarwLVdnmQok3rJ1l45onLxdgrD3lvAWUAuRg0qIg0iVPuBM7o5ZUffcZ+bw9
 kHrZNJfJsJpuSfe998R9/dl2EuVUGuqts/VvcnZYifR97yvCNDOAqjka6aqSb49+pGjK
 K5S/iTwUYVDzSz7oDsO+L6Vx/egTvDStrOoULGymIm82bcYv+jC0ICctRLyg8NEIavCq
 R+dvjYJ1AUNXvkSgLtcLSMUBx+IZ+iyKYTuNI9emiQwsSV3VaXIUaopxE6VkoiZUcPBO
 F7nw==
X-Gm-Message-State: ALyK8tJyvhy82H2ubH+YMw4ig8kQDaUWXhexdyiZTHsvVfqeYEhfYq9XfHPE/o12nvfYmm6ShV1FjSBZxt8wCA==
X-Received: by 10.200.40.88 with SMTP id 24mr7677455qtr.73.1466415244960; Mon,
 20 Jun 2016 02:34:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Mon, 20 Jun 2016 02:33:45 -0700 (PDT)
In-Reply-To: <57679B29.3030502@ozlabs.org>
References: <20160617032011.12542-1-openbmc-patches@stwcx.xyz>
 <20160617032011.12542-2-openbmc-patches@stwcx.xyz>
 <57679B29.3030502@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Jun 2016 19:33:45 +1000
X-Google-Sender-Auth: J9uasBB4otnkyPB2I5bU4XyUDCo
Message-ID: <CACPK8XfQiAHT42edeCLBiM+=rOCvx3UnjLcq61GogoL1xQHGSQ@mail.gmail.com>
Subject: Re: [PATCH docs] cheatsheet: Explain how to boot the host with curl
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2016 09:34:10 -0000

On Mon, Jun 20, 2016 at 5:28 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Awesome! Can you put this in the userguide too? Maybe at the top of the
> 'Host Management' section...

I've done that. I'm overly familiar with how documentation on the
dbus/rest APIs should be worded, so feedback is welcome (I also need
to move it to the top as you suggested).

 https://github.com/openbmc/docs/pull/29

Cheers,

Joel
