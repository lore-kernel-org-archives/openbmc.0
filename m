Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBjcF3Cd2zDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 09:44:29 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v3ONC0TN031639;
 Mon, 24 Apr 2017 18:12:05 -0500
Message-ID: <1493075519.25766.241.camel@kernel.crashing.org>
Subject: Re: Switching to 4.10
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Edward James
 <eajames@us.ibm.com>
Date: Tue, 25 Apr 2017 09:11:59 +1000
In-Reply-To: <CAFd5g47SMzF=FjYrZkVx6y-L1+D3AGHb7-gQO5W=mzvW+RnTRQ@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAFd5g47SMzF=FjYrZkVx6y-L1+D3AGHb7-gQO5W=mzvW+RnTRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 24 Apr 2017 23:44:31 -0000

On Mon, 2017-04-24 at 16:07 -0700, Brendan Higgins wrote:
> I just posted the latest version of the I2C driver this morning.

Thanks Brendan !

I'll try to review between flights :-)

Joel, can you and Andrew torture it on our systems (including UDC gunk
etc...) ?

Cheers,
Ben.
