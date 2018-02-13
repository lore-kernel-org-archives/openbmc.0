Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oPnu55va"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgny1429gzF1Qg
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 03:27:33 +1100 (AEDT)
Received: by mail-ua0-x234.google.com with SMTP id r4so11916253uak.6
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 08:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=oFVUYVTUwF76r2cCtr6XPKpzk/eCktTmbKjES3+iJq0=;
 b=oPnu55vapOxlJK8lcdoQVD1n6zr8cyKTu3wUnrIWmfQdMBAY58gr5Ww9l7+GgEynUO
 UcuB2dqsJbeSDUG40DdfUiSKYbiBHG7IQDt9RsDXsQLYlJuXPjrtGZkRCPzaXfKBaEo2
 fc/jX1qJSCSzECvpdktflEOuH2QZ28ALeCRFXG7uiZIGXqRF6p/Dgtll4TcvTW1mm8G0
 aHhN7TuLKs9EOqj34ZbHjSkOeJT/tLpWBB/8RYhrIEtN8nKOo+0C2Y6QXhNqq+8X6Mpz
 0vgBoV36v8zIUL6i+K2Y4lOdw4153fdwQLJzaPko40Xjep+iDxEwfjgmjF0Rckt2DioT
 gXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=oFVUYVTUwF76r2cCtr6XPKpzk/eCktTmbKjES3+iJq0=;
 b=DR2VJVcu/7uZVQF82ZwqhDpNBpvgpnMtFfedSxouAQvndyha17HcRXRFS0/AVM20Yx
 0X7sSr+ews0iss9HEY6rGAOUT0a6Q2tEaD10s5cd58fPNlVkUoP6mWPZWWS8yuRqfBXe
 oMo1Rp16w1BObbVAM/g0jYp2YgCPNQMq/IM5Sns9RZIbauFH4wSMIMMBOym+igj+SDoD
 j83iHzGD77tJ0P5jqMHMhPJGtN6tLKiAKmxvjXaIJPnCBXo93cVLyrT5YqQDxjFn1iPe
 nnWKcL3V5gb/wgFGlQemntRmEArUe30gkEw4wUBkDiE48jzmt3sgRDJLoq+y5GDayE9c
 8Fzg==
X-Gm-Message-State: APf1xPAoAUMjqjW0jwFpTjPaCeSW2ynsj+rSib5n9IkE3esv5eM2Swvu
 zVlaMNMy/cf5R1kbVDZahaKPbcFA4pglVXEci+7nzFKE
X-Google-Smtp-Source: AH8x22656bLZuRrM/8zte4ywfQ8TXOAo8/St9G49JrJ4njG8KuSwRMjR+kicpDrlMdFYYpKWWiSzEzcGi+F/8RVEGOQ=
X-Received: by 10.176.0.229 with SMTP id 92mr1774962uaj.33.1518539250668; Tue,
 13 Feb 2018 08:27:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.167.207 with HTTP; Tue, 13 Feb 2018 08:27:10 -0800 (PST)
In-Reply-To: <560ecebf-d449-b7e7-675b-03ec3c6f4212@yadro.com>
References: <560ecebf-d449-b7e7-675b-03ec3c6f4212@yadro.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Feb 2018 08:27:10 -0800
Message-ID: <CAO=notw8DrRUP7MiFmDcQ9jqypeFqs6xmwXxPYt_jPf+dtP0DQ@mail.gmail.com>
Subject: Re: Proprietary task references in commit logs
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 13 Feb 2018 16:27:38 -0000

Alexander;

So, we've been in a similar boat, in that we have a Google-Bug-Id in
all our commits.  However, for openbmc we've been trimming them out.
I think part of the argument is to keep the commit message clean, or
if necessary file a corresponding bug in the openbmc bug track, and
then close that bug id.

Can you point the jira bug to the github bug track?

Patrick

On Tue, Feb 13, 2018 at 5:13 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
> Hi all.
>
> Do you think it is acceptable to have a reference to a proprietary task ID
> in a commit log?
>
> We're using JIRA and would like to see related commits displayed in the
> corresponding issue. That requires putting the issue ID into the commit log,
> so the log would look something like this:
>
> ===========
>
> Fix some bug (less than 50 chars as usual)
>
> Long description goes here.
> Multiple lines, each less than 72 characters, as usual.
>
> Company Ref: KEY-1234
>
> Change-Id: I5e0f94d168a61b6d82214779aa6ebd9796dc37b2
> Signed-off-by: The Author <t.author@company.tld>
>
> ===========
>
> Any comments are welcome.
>
