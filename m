Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iCp+Vilr"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40S7R11YG9zF24d
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 17:54:04 +1000 (AEST)
Received: by mail-it0-x235.google.com with SMTP id 19-v6so1487710itw.3
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ER8DfhVNcWULMOC2OvqH7h8i7nTOt+QL2G7BtBFLIpw=;
 b=iCp+VilrXw8YFF1jIpnkGbUXGNd42UglgMnt/f8Z5LpCSVn8uzUsGJXycv7LxWyQp9
 6a+8/LeqbyMgr2TRcIMidqF3yJZQH7yRnlbh7Yj1jFUVzJOmqhFtfOhHk5SIKH0A527V
 DjVdHz4xLPGPZSthDYqtSdrEaNErJgKLu7VJg+2MzV+b+k/runU794PPGTTIRyVrLEqo
 fGmXJBxlu5gyP+gSxczgakqCAZilazjbcdJmXEWFWV4///vGK9GAA4FD1kQvdm/7djqb
 1GVpUc/ZcG1IIUK8qfICq2wLcSeFthstbA7G2Hf0NeRj4r1umlQZewyAV8WKIz49Viaf
 Szsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ER8DfhVNcWULMOC2OvqH7h8i7nTOt+QL2G7BtBFLIpw=;
 b=p8qkXgkCR3CuRM0pUWKcLjeizF3n+3lyyodmfQP+fRPugM0N6z5cbbbPN2oyNnBjVG
 G8hC3HcnHT/XguO2CtBPZh1nUhf2SrtvROkz9ZWBFOYQHlPJrL1rOtsIOSQ1FxQhmVT4
 d5FtnkBJm0eo3uG2x03GOPRc0VVDmQJQRqUjU38hl8RUvWOFYo762e3DbjfVzbicdgFj
 cfm+iq+ymL9pAU+vM2EAeKyMgWqHPlqHQw7EAjVXdsFO2Klww9WU3zZOQE1loFL6HNpr
 gRvjGEFPal3N5AOOuYSV2GCc5WxczpneOSUlr3w12kBFbtUO4uiJUEbwY8x78B4SZs79
 dIUA==
X-Gm-Message-State: ALQs6tAg+umDtUsvTcpaA41uR3lh1y9xyK/gJSxHX/e7eS2SZSdC1YbV
 dWtVMm1ErlOlYY9e1n1+i0eNsFlt6UH0FppLqhs=
X-Google-Smtp-Source: AIpwx48SMa/NHVvwLgW9tdKXC2SYB6rhB9GGFlm6jEKTU1wtCf3GMwflkmyZ4AjRndu7Z6jartQ/aHTOpn14ih4i7j4=
X-Received: by 2002:a24:aa0e:: with SMTP id
 b14-v6mr181279itf.121.1524210842369; 
 Fri, 20 Apr 2018 00:54:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:1f84:0:0:0:0:0 with HTTP; Fri, 20 Apr 2018 00:54:01
 -0700 (PDT)
In-Reply-To: <cf4ed490-47a2-d644-f929-1fbcddf27c2d@ozlabs.org>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
 <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
 <87in8mfib1.fsf@linux.vnet.ibm.com>
 <cf4ed490-47a2-d644-f929-1fbcddf27c2d@ozlabs.org>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 20 Apr 2018 15:54:01 +0800
Message-ID: <CAARXrtncu8O6sH3R33S=X68gmXAPO16_fkF0d1EOeaDhHPqiLw@mail.gmail.com>
Subject: Re: Fwd: Migration to new gerrit server is coming
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Stewart Smith <stewart@linux.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 20 Apr 2018 07:54:05 -0000

On Fri, Apr 20, 2018 at 3:31 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Stewart,
>
>> It could quite legitimately be IBM being stupid with email (again), but
>> could this be because of the migration?
>
> I'm getting these to my non-IBM email account, with the sendgrid link
> rewrite. So it's not just IBM SMTP here.

Me too, the gerrit's mail contains a lot of links staring with
u7284519.ct.sendgrid.net, probably gerrit is configured to use SendGrid[1]'s
service?

[1]: https://en.wikipedia.org/wiki/SendGrid
