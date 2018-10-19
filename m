Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VhpCXUwD"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42br370gW5zF3JZ
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 13:49:06 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id u22so31806911ota.12
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 19:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tx1nFZ8quVxv0fkkSkgalAr/b2HJkWWf2B//GO6qrWQ=;
 b=VhpCXUwDuk6psWi0yeI3YV1kGK6Z+zdnVZVrqnXOz5lXzMAhG7App/ei0XC3AjuaZo
 +kKFafZhLbaBnChMxEF1GOVlSODftGPrxMW44eiSE2BrZL/3TLYAcd1/1Gpa2mcEi4d0
 0yTeCS0PyW1YJcPFnK+nChqPECb6Q895ztV2EGcCGYEuckjq330DoP9jjdGuQuBsf9lO
 jk7Zup3s9wnj7wowZ68wpMc2b4DE0T3QVIz8HUdXj+o+AHMqYJJXqJZWZ3sZj6UgsZuG
 1UKVMHd4NrFwrOXuiPTEZSLVRcda72ERPv+fotDXP0xeYMNmk+ihtwQg/TGIBrcU4deZ
 Q2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tx1nFZ8quVxv0fkkSkgalAr/b2HJkWWf2B//GO6qrWQ=;
 b=bAAcJt8ZMNZMnmMNNL6moofB3NvFE6Lo52Q1h9jaipPX3TbtOo4gMvIOlpmXuMdne9
 Syl6j/70Dh5vYKZxFgrdRJG6/gnNcCQnaMWu8Umb2e0Iz374GmiHR/mF20vdkFbKfyJs
 a0frr5hHSjCYRKmI9RyxcWcxklqCWkr9qF0L4J+pvF/kXgUFAifjK9+SwnDd8QuPq0sk
 iMNKO14065gIMdryJgp2Ac/5xX24DdJa9DnSSihI2ADGq8I+pMfaWgXST+qqBmROxV/M
 gjselLnKmKl2N3JQlDk63LW7m91tMGqlEdUYHzG217SB7VvlawzCJO0n+PHjdTOInZDB
 8UTg==
X-Gm-Message-State: ABuFfojoPl8sYV+jn9khlEpTUIB5sEHFvqCISvBKCXUFCRYxAHfTmsei
 CUKzL9fjB+g1hcSg6aPtoNUP3RO3SlmmNgI60Cc=
X-Google-Smtp-Source: ACcGV6094n9UJwjOsAwAXQ/WVFpczcgJB0QSrDF23eeiLq6cDi1YWqe/FV7aUz6q21AbxR2X6TTlC2mYyF59cJv5x1g=
X-Received: by 2002:a9d:1ea5:: with SMTP id n34mr20362466otn.160.1539917345224; 
 Thu, 18 Oct 2018 19:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzFEfBpKCdQ30WO6v9AZ1xh+OLg0jpsEiuGF17x2gFKzg@mail.gmail.com>
In-Reply-To: <CAO=notzFEfBpKCdQ30WO6v9AZ1xh+OLg0jpsEiuGF17x2gFKzg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 19 Oct 2018 10:48:47 +0800
Message-ID: <CAARXrtmt6PZkbkXEPNCPMikn9XBhZdOpgTeoupT1QCD9RfKOyA@mail.gmail.com>
Subject: Re: New Checker in the CI
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2018 02:49:07 -0000

On Fri, Oct 19, 2018 at 4:30 AM Patrick Venture <venture@google.com> wrote:
>
> Now a tool called cppcheck is run against your code during presubmit.
> Its results are not factored into your patchset receiving a +/-1.
> However, I encourage you to take a look at the presubmit log.  It'll
> have some results that are neat, like, "you can reduce the scope of
> this variable" or you can improve performance my making this a
> reference, etc...

Good static code analysis tool is always great!
Reply this mail only to show my +1 :)
