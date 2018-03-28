Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::230; helo=mail-it0-x230.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GVERi4tY"; 
 dkim-atps=neutral
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BJWx1QQWzF2J1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 06:55:23 +1100 (AEDT)
Received: by mail-it0-x230.google.com with SMTP id j137-v6so5315832ita.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=osl5CAY+1HvZkQNbe74U/W6n9Xeaw6D6JVfHVG+WXG4=;
 b=GVERi4tY6qs2SO8aVb8tvOAJo1Ws/iv3cfOPCOeI9K8eRVrO07ruBnJeimMTgN74sF
 SUP3qN2W8LKle+pI7hW+GHZqyH+B7UGxDRe28OUrUk5jUEeyuwLqnbWvzP+NRiPDM8Xw
 VUPxDo35l+2UfWEArMiClNHmTeqMFq0tQj9xH/kJ0L84PirDiO+CWUE2ZnXKLZ4ClP8E
 TpFnONyDUAiVZniv7RNMz5fwfRRrtBH8iB/9zYV1UCe5+UfMn1J/ACsVauA+ev8jZ4nH
 +22OYE6YuUck5qOwtHIqoldWlZeAEE4zjHhTl2A1zSX9HrXT8YQzZc0nZVjkoFWIwebS
 7hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=osl5CAY+1HvZkQNbe74U/W6n9Xeaw6D6JVfHVG+WXG4=;
 b=UOJp4s92zEjrAQycIooltZ31OWjNgycja8PZmd3GrV81LbnbnzIrLlzAe5vxxvFhiE
 W9Kgv6sY98wpvJ9Xhz25pmRFgBPplZEwiMYOXv/QvfeiNHgn1lOh47eOY/xJu0DulaOc
 RN29y1/CcA31dnZkbBhxqNZxnB7IE6Wf/O1oRpWzfEy1ZxYa7KGUpAWyb0xqHeUGwoX8
 vGlY5+ItvFFN4ExxPqDa2GYkgWZMHnBEWRm69RM1YWJZ6DEvw19VklJFCEosN5y0wdR0
 AZ8bjgDrmmerP7ZuJzMUWmG4KsnwnDJe2j+73us/Pj6OhaDQRl0MYaX81KGDOsC5pq2p
 IXOg==
X-Gm-Message-State: ALQs6tDSCmaPY802vcsGtb6pCNa6oQUiRNIyMwdxi5dJw43OBVdzFKR6
 Kk4EuoNOeCo/EeTeev4cUipIBEL8JoAeOnkpFeEAug==
X-Google-Smtp-Source: AIpwx48EQ0Hh/ydYdEEgQhE/EcE4urhKmrpvEdykvBiFgV2LagReiRLKtLovl5cJ2ZEcYNWGFcqUCi8Ohu9Rb045xBI=
X-Received: by 2002:a24:39c8:: with SMTP id
 l191-v6mr4821388ita.81.1522266921608; 
 Wed, 28 Mar 2018 12:55:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.11.159 with HTTP; Wed, 28 Mar 2018 12:55:20 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 28 Mar 2018 14:55:20 -0500
Message-ID: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
Subject: Migration to new gerrit server is coming
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 28 Mar 2018 19:55:26 -0000

Greetings,

We've gotten ourselves a nice big server to run our gerrit instance
on.  The virtual machine we're currently running in is going EOL
within the next few months so I've been slowly working on a
transition.  The migration should be pretty painless.  At some point
I'll take down the existing gerrit, migrate the data from it to our
new instance, and move the domain name over to the new server.

I've got a test instance going now and would appreciate some poking
around for anything obviously wrong.  It's running the latest stable
gerrit, so we'll be getting an upgrade in this process. I synch'd over
the data from the production gerrit this morning.

https://test-gerrit.openbmc-project.xyz

PLEASE NOTE: No review comments or merges or ... anything will be
saved or executed on this test-gerrit so don't get the two mixed up :)
 https://gerrit.openbmc-project.xyz is where all real work should
continue.

Andrew
