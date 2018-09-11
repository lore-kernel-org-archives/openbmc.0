Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22a; helo=mail-oi0-x22a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jqpkKdH5"; 
 dkim-atps=neutral
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428tBY4k68zF37x
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 04:05:57 +1000 (AEST)
Received: by mail-oi0-x22a.google.com with SMTP id 13-v6so49081477ois.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AsUmdusjEhLXMdxfOdOBpmYKwXzkrlU21nLmQaNIrRQ=;
 b=jqpkKdH5jB8xSynV3z/kn1xz7ovN/lRO7vqwUzxwSGNgYMQ6SSBOpxx4qc6mX1tl8j
 UAbuFDLecSsg1JnUWgCheGJ19S1ZWkEHX/ZAJPrBeirA5gv6TGdzozzOLFeKlVZgI5LT
 ic9/to/1J+nSSb1OaTs/wcBNVRuRAroJM6LXiZvW9XCquWWQgJrhk5Wuz+rbGfSHwP3i
 Pad6PK75QQttmAFmfCpVEha/IPnzAdJinkEbCKuTXKoKUUKPjmScvZksmOhn6KbZ8/MP
 b3u+67SvQbvHw1MQuOGUkJIJUTqK4PxHEgempkuf/FoUiPRFAlqRzgZTWml8SuovvoDg
 OEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AsUmdusjEhLXMdxfOdOBpmYKwXzkrlU21nLmQaNIrRQ=;
 b=oOizAyoSLPaPPtP8cYQrUutpl71YdzCp7wiuG0HOXX2cLCs9ADydjk8ooJkl+0EPRi
 NSalZULZyEx0mfL0hzIMKjRl5YXSUpS//ufne6m2xXsyh2QAzu1T+VuGKQb77p5IaFAQ
 LrPi3hJ2GElw4P3+GxaaPT/y7yq4UM6TPO0bY7WBCYOas3rv4AjY4SFnSdVfwO1lThTt
 M87C7ru54uth368fB0v7eUtptfz7UIHeHIKH2oSmZaIgzb+mtgUC8wF3tVV7c7zxopUw
 +P8lcNzQQtli+ApGZNet45iLu8Gxxgyo2TDrTmbCEUha88SamEgBmeQRJDk4Cr1eVzkT
 o5Qw==
X-Gm-Message-State: APzg51DvF29zOxH9chpJ30OjP3GncweYXjYwQ6nHib11j386ywyTUehN
 Y2TmUj89R9bPKUODILBIQaR5O3BaBOu2SOGjywlEhg==
X-Google-Smtp-Source: ANB0VdbyDWRNDLpck769RYbdzoRMV1zENqaiSYpL4tMn/cVer4bMu94BzRR13g223cX7AlO/NSRZltlMywdjzgmoKbA=
X-Received: by 2002:a54:458a:: with SMTP id
 z10-v6mr21353129oib.324.1536689155233; 
 Tue, 11 Sep 2018 11:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notx6QwNkQJ8HgDFJWqDChVw9j4ye=1qSWz3yaFBFYAOEMg@mail.gmail.com>
In-Reply-To: <CAO=notx6QwNkQJ8HgDFJWqDChVw9j4ye=1qSWz3yaFBFYAOEMg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 11 Sep 2018 13:05:44 -0500
Message-ID: <CALLMt=qCkxga7=8ttD9xC4jtSaE8M9piJPB8UuHnHTSNV0rLLA@mail.gmail.com>
Subject: Re: meta-google
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 18:05:58 -0000

On Tue, Sep 11, 2018 at 10:24 AM Patrick Venture <venture@google.com> wrote:
>
> First commit.
>
> I am a bit new to subtrees, so I was following the steps to get a
> configuration into meta-google, and following the steps didn't work
> because there wasn't a master branch yet in meta-google.  I submitted
> a "first patch" to meta-google/master via gerrit, but it appears that
> gerrit isn't sending that patch (yet)?
>
> I'm just looking for a quick -- why did gerrit not push the commit?
> Perhaps a configuration change required?

I didn't see any errors in the gerrit logs but the synch didn't happen
for some reason.  I did a manual push and it worked fine.  Not sure if
that first gerrit synch needs a manual push to get the master branch
setup Brad?  Let me know if your next one doesn't synch to github.

Andrew

>
> Patrick
