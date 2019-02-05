Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43vBZG1nGYzDqMr
 for <openbmc@lists.ozlabs.org>; Wed,  6 Feb 2019 04:36:05 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 5 Feb 2019 12:36:27 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Tanous, Ed" <ed.tanous@intel.com>, Jeremy Kerr <jk@ozlabs.org>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>
Subject: Re: [Redfish] VirtualMedia
Message-ID: <20190205173627.lju73ko22y4etuab@thinkpad>
References: <53D123781965AE42A2ABEE982B242E41A1007CF9@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <53D123781965AE42A2ABEE982B242E41A1007CF9@IRSMSX102.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 05 Feb 2019 17:36:06 -0000

On Mon, Feb 04, 2019 at 10:12:46PM +0000, Rapkiewicz, Pawel wrote:
>Hi,
>
>I've reviewed some email threads about implementation and usage of Virtual Media, and I tend to agree, that Virtual Media schema was not designed for usage like web socket proxy. I'm planning to propose some OEM extension that will make Virtual Media closer to our needs, and I'd like to ask you what would be your usage of NBD over web sockets, are you planning to mount NBD device only in BMC, make it available to HOST over i.e. usb gadget, or both depending on use case (Any other?).

We are planning on making available to the host via usb gadget.  Just
curious - what are some use cases for mounting the file locally on the
BMC?

fwiw Adriana and Jeremy had been working to this design here:

https://lists.ozlabs.org/pipermail/openbmc/2018-July/012647.html

Based on the chat in IRC it sounded like Intel might want to tweak that
slightly and get rid of the nbd-proxy as a stand-alone application and
move that functionality into bmcweb.  Did I understand correctly?  I
don't think I'm opposed to that or anything (Jeremy/Adriana please
comment if you have any concerns there) but can you comment on the
motivation for the change?

>
>I was thinking about implementation of Virtual Media Service, that will allow those actions, but before that I'd like to gather more input.
>
>I'm attaching link to nbd-proxy functionality implementation in bmcweb: https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/17749/
>There are two proposals on how nbd-client can be spawned upon web socket connection:
>- systemd watching Unix Socket files
>- VirtualMediaService triggered by bmcweb
>
>Systemd tends to be easier, but with less control
>VirtualMediaService allows more (like usb gadget), but would be better designed if I'd receive some input on your use cases.
>
>Regards,
>Pawel Rapkiewicz
>--------------------------------------------------------------------
>
>Intel Technology Poland sp. z o.o.
>ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
>
>Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek
>przegladanie lub rozpowszechnianie jest zabronione.
>This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by
>others is strictly prohibited.
