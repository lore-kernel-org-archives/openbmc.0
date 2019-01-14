Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OacYRVuX"; 
 dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dq1d5R6zzDqWH
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 10:09:50 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id c19-v6so684157lja.5
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 15:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEapSWUKp5km3VPLKIs8fc/GMppUwEdhGa4T0xKRbFA=;
 b=OacYRVuXJNcS9cjudDz8ykYMt2llNnKnAdtcOWYPBjjiWj45rYg8gdxzO8fmpxKyZH
 Gx6RfX+QFXgOa6YZRRHs/FouaR+RpRziPJQMfS+lyY1aF4zytrtI0n4yiV5JLkmrFqIN
 gfcPs1g6vo+UfysowIPt49EA4hFXfkjM56FLdZiV5kJEHgQ2cOqZwGw/z/jKrB6OrYj0
 Hg9Urz5xMvSrGgk2r2daIdfM0LwnRDmboZmUwCwTmEsl0BW2o/pLZGvpsxWhwMuSt95q
 /Ygx2ygiluGcZttbckBMdDTWO4FduHzzporZwl21+C49DLfIVNg53HVwwD1J/eARCaFT
 1ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEapSWUKp5km3VPLKIs8fc/GMppUwEdhGa4T0xKRbFA=;
 b=sT3zPdRvR3rdt+Xv4QPg0VdW1MgFuC2AIYPjyuWdp3f4EH8FBa6+JbNxEJSW/TPbDX
 UkMU4ZlfafsDEO9/3IbJ4yhf8OfLUswCktxldhc/0zm3qXqqy9TN4wHJ1rwaHC5LDYK6
 x2w9z4OvOCNsgfHpg74XgckA/QSTYj/WwmJwzItC8qK/l9CgMWb5X8ZF2sPRrezVBnaa
 Grp81/MOxfZAA36k8koCfQyJ07SucIw0kylSKQBO7Y62i7ItlfftbFG7nQTf2rquguxL
 b3oG6dDY+dU+rICd7oCL52s57lW374j4JDEV6l03E+wYWJK52r27x9ySVRV5kjUZd8tD
 PXDA==
X-Gm-Message-State: AJcUuketWvhMAhVOdBaQBMRe58FXrBZSo5jWenekcZBMYUJgNMmKsxEE
 EA4FnSAHkYftdj7VTk8XMRHn7g5HFQ8wFATVkrVP3w==
X-Google-Smtp-Source: ALg8bN5QtxJUGG0mdgbiXRvl5kIVk7YAx2J+NM89nFXfe3jdpyxk/mUx36l8eqwUGR/wU5T1vtwNMedOnBoaUNkiMlk=
X-Received: by 2002:a2e:97d7:: with SMTP id m23-v6mr661964ljj.18.1547507386921; 
 Mon, 14 Jan 2019 15:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20190114161923.GD7259@mauery.jf.intel.com>
In-Reply-To: <20190114161923.GD7259@mauery.jf.intel.com>
From: William Kennington <wak@google.com>
Date: Mon, 14 Jan 2019 15:09:35 -0800
Message-ID: <CAPnigK=9s2U6wYgRBu2TFNBzjNb3Jq5uUmXbHGDvD=GKoCmbXw@mail.gmail.com>
Subject: Re: logging level conventions
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 14 Jan 2019 23:09:59 -0000

Agree, hopefully it is being done this way already.

On Mon, Jan 14, 2019 at 8:20 AM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> When making a change in netipmid, the conversation came up about user
> errors versus system errors. There are times that both should be logged,
> but obviously system errors are more severe. So in that project, I made
> system errors (like failure to communicate on dbus, etc.,) as log<ERR>()
> and user errors (like bad credentials) as log<INFO>().
>
> Does anyone else think that the project as a whole should make this
> distinction between system errors and user errors? Maybe add something
> to the coding style?
>
> --Vernon
