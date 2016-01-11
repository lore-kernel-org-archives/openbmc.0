Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1C62D1A09C0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 18:20:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id ED932140082
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 18:20:30 +1100 (AEDT)
To: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Subject: DBUS interface documentation
Message-ID: <569357BE.1030403@ozlabs.org>
Date: Mon, 11 Jan 2016 18:20:30 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 07:20:31 -0000

Hi all,

We're building up quite a collection of dbus interfaces for OpenBMC, but 
our interface documentation is disappointingly sparse:

   https://github.com/openbmc/docs/blob/master/dbus-interfaces.md

If you've implemented (or are implementing) a DBUS API, could you also 
submit a pull request to update this document with the new API?

This will also allow us to have a bit of a review of the new interfaces 
before they're committed.

Regards,


Jeremy
