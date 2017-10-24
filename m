Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::232; helo=mail-vk0-x232.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="T0dgHlVi"; 
 dkim-atps=neutral
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com
 [IPv6:2607:f8b0:400c:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLyfX1wvMzDqfh
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 03:00:34 +1100 (AEDT)
Received: by mail-vk0-x232.google.com with SMTP id b7so9911756vkh.12
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Xi0wYxJrU/GelQzw5GmGkngwgRRpVmZ+UXtG6/Bbjvo=;
 b=T0dgHlViX8hSkxwrfDECL2L0PEsqixLeNf2p22PZ8VnXzMVhB+aCRr3h6zozbSivks
 2DgswLt5DRR0CCz5KkADpxhFhIO++UPmasqOKE1BqdvR0IJEImVAUQgADssAQWpF2mSX
 SwsOgAjHBaO7bEvitDZx6cwp1ZCRDO2ZLV2rekuUwBpotZRT/zfxG7FphaNCb5wBT5Ki
 sbRN2poOXx9m+CNXwrJeWdxNoEFpw8Lc/hjaGAaXVA0pPNvsfjgkzfP7nYXpS1PRFt3k
 4LRTUGMGUeCCNBcY1cU5dZE2crqkjXkMP5o32T0/O4JE9zlRYw1VYgW8DRCzRPfW6Zs5
 gBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Xi0wYxJrU/GelQzw5GmGkngwgRRpVmZ+UXtG6/Bbjvo=;
 b=ile42l7+SGnW9a+DsF5xWZCrPuJCc/iAP27nU6oJzwz28Od1JwqxFAe3mjO7ImOHNk
 pa6y8ARq1aUiDakqd6Cu13JZ76mktrGQ1rNJq1HVe7W3Tw5H8sCMBqfdGtMyh8OBr13+
 lyc/IYDo4nXXC8iiP+RHm2MNGCDiKGASG2yrWOyQs3PpUYaHzJzA/5jgIsZs0xPxwir3
 7jJqXX5DISfGm/6vsF9kKLRpElxx91Vl9z8Z8iX9zpTMnZH6BF2+6k11lN9Esk/kPs7l
 znXiU5wIP29KjDZp9TlVOOACp7XFAm2gE8kOaeOUbsxaSOmMYGayK8guAwzojItx39CN
 MLzg==
X-Gm-Message-State: AMCzsaXxkGjY24fdj1S+GQqWgPmCpjmvMX1euW6XOHadEbUEdT/MzBma
 qb4WSQ4z7rmIkT+ojfQS0H7a6d3QDIdnMls7ioFyTD+Z
X-Google-Smtp-Source: ABhQp+QZF8pRQMr7D4hT2v+pdczzrEYKQCXcGorUHbdNaoqgQlof//US+w+NB75fOPJkooHE2PorcBHEKrQPQIRi+Ic=
X-Received: by 10.31.55.137 with SMTP id e131mr11798514vka.143.1508860830680; 
 Tue, 24 Oct 2017 09:00:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Tue, 24 Oct 2017 09:00:09 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Tue, 24 Oct 2017 09:00:09 -0700
Message-ID: <CAO=notzMCeznZxubwN2shi9L3uxK0-j3QdWAjJEdnnVtG36C9Q@mail.gmail.com>
Subject: OEM IPMI Command
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 24 Oct 2017 16:00:37 -0000

I'm considering a new IPMI OEM command and I'd like to run it by
everybody and see if there are thoughts on it, whether it'll end up in
the OpenBMC OEM namespace or not.

This is a bit counter-intuitive, but it may sometimes make sense to
control the BMC from the host, more than reset, etc.  What about being
able to start a systemd target?

I have a use case where, in situations where I'm about to upload a new
flash image that I may want to turn off all sensors and other
at-the-moment superfluous services.  I could just tie that into the
update service targets, but why not have a general case for this?
What if there's some diagnostic you want to run or something else.
Perhaps you're on the networking talking to the BMC and it's not
responding how you imagine so you want to do some sort of dump and
then collect the information -- provided it's working sufficiently to
handle that.

Thoughts?

Patrick
