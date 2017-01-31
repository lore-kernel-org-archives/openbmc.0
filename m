Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x22e.google.com (mail-ot0-x22e.google.com
 [IPv6:2607:f8b0:4003:c0f::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vChvL5l6kzDqBh
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 10:15:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lLhFF2pU"; 
 dkim-atps=neutral
Received: by mail-ot0-x22e.google.com with SMTP id 73so278018993otj.0
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 15:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=NMgXSTHbf+S4yMHMNCRmpQ0tfMK7VQhainq7ZSd/3yw=;
 b=lLhFF2pUrlv6UNqK3JSq3coOxBHwzV6Or1hT6wgvJh39/PLxPEbmzej2Pd3f+xcyju
 8pyBqwZAjxp+O4J96rjb1t/A7A053BFCabFB+jrxPB0l6rPfNB9zmp61BgSQciL+9ldm
 UXLKskICJHH9M0zrQVgSmQyysb+Yw8bxBay2i7vVWs8h6euKbHmrD/tD6zvOVRLzraZ5
 COekujuZpAu0j6gUSw/YZ3qiwsjSmOElijD8o1Ma8lM6z18jOuSawaUKN2YcotOLk6N1
 hkFwN1kG4hNOIxoHqU6dufdvxSUfr5wvCLtaQUXZGmmrlBqKZP14pwl0FiIB+t+8jF1l
 0e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=NMgXSTHbf+S4yMHMNCRmpQ0tfMK7VQhainq7ZSd/3yw=;
 b=ih3qk/SjUrqFznKdxXnjymXo78Eq12+NMsLxjkw3TgQdTlFyRd2nDCoL4JpIFeQIpS
 Cxsp3YvE+nZFCzcO4Gz2G9L/kjiXusq2MpFyVt5Z4CmHKq4n8joyta0GUhxPEtqqZ/K/
 pNOWbayddXmNq7Gf598Tbn5VldH9p/a6Ju0zt0y2s4XsM4QGtNFHM7+GyyuG9pcTxF9t
 paF+FEzE+zP0HO406WBUWNjjEjFepXfq5mIUdYLhGIE5KzFymH6Z4oaYMj+Ji8eRor3k
 QpBj1MF0PBJ80ZqlDHKYT941ac2xROaAqR4mDTrPVVXkY5VmAPeVCNhBnkcfHRsmbxWN
 i3Mw==
X-Gm-Message-State: AIkVDXLlQ40fBhkpEQhTH+ly983g5sU5Ew8FLWLKBLXIRjACT04wLZtcVcpDMp3OOkHRJhtDQY2YPOOsjR6tzg==
X-Received: by 10.157.25.140 with SMTP id k12mr16462855otk.174.1485904539951; 
 Tue, 31 Jan 2017 15:15:39 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Tue, 31 Jan 2017 15:15:19 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2017 09:45:19 +1030
X-Google-Sender-Auth: lOigytp8vbtMwLsI1-9IJgMqcQY
Message-ID: <CACPK8Xe4g78ERw_gzj3O1Y56bAtucAewyQAoy1Z9sZOwHLvRmw@mail.gmail.com>
Subject: DMARC, google.com and "via openbmc"
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 31 Jan 2017 23:15:43 -0000

Hey OpenBMCers,

tl;dr: emails from google.com will now say "Googler Name via openbmc"
on the list. This is intentional.

The details:

DMARC is annoying for mailing lists. Instead of repeating why, you can
read about it here[1].

google.com has a "reject" DMARC policy enabled[2]. This means that
when a DMARC enforcing recipient (such as jms.id.au, hosted with
Google Apps) gets an email from a google.com address via the mailing,
the recipient mail server will reject the emails. It appears Google
Apps chooses to silently reject.

So since google.com turned this on some time late last year, I have
not been receiving any email from google.com addresses.

Our mailing list software (mailman) has an option called
dmarc_moderation_action that when enabled will perform some extra
processing on emails sent from a DMARC enabled domain. That processing
means it re-writes the From header to be "User Name via openbmc
<openbmc@lists.ozlabs.org>. This ensures the mail passes DMARC.

The Reply-To header is set as it was previously so clicking
Reply-to-All will still do the correct thing.

I've been seeing mail from Xo and Rick today which indicates things are working.

Cheers,

Joel

[1] https://wiki.list.org/DEV/DMARC
[2] https://dmarcian.com/dmarc-inspector/google.com
