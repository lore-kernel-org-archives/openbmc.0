Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445hWD136HzDqSm
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 06:39:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 11:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,400,1544515200"; d="scan'208";a="117070375"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2019 11:39:48 -0800
Subject: Re: obmc-ikvm host OS console mode issue
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_601B7E351099FC4A291EA922@qq.com>
 <2648d3de-e949-3eee-c2be-cd8e119d4c7c@linux.intel.com>
 <tencent_67F229E84D938D9265BEC618@qq.com>
 <3fc3e83d-b297-c2a9-aeed-01783c79c982@linux.intel.com>
Message-ID: <6c6c1ecd-91a2-b42d-61fe-2a6003d370fd@linux.intel.com>
Date: Fri, 22 Feb 2019 11:39:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <3fc3e83d-b297-c2a9-aeed-01783c79c982@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 22 Feb 2019 19:39:53 -0000

Tested it using the latest libvncserver too. Works well.

SRC_URI = "git://github.com/LibVNC/libvncserver"
SRCREV = "3348a7e42e86dfb98dd7458ad29def476cf6096f"

Cheers,
Jae

On 2/22/2019 9:07 AM, Jae Hyun Yoo wrote:
> Hi xuizhi,
> 
> I pinned libvncserver at commit aa8a1aa76880ffb8f23b98d0dbe35988b2609877
> 
> Best,
> Jae
> 
> 
> On 2/21/2019 7:01 PM, xiuzhi wrote:
>> Hi Jae,
>>    I am afraid that this "Refresh" issue is related to the libvncserver.
>>    Would you like to tell me your libnvcserver commit number?
>> Best,
>> xiuzhi
>>
>> Hi xuizhi,
>>
>> Virtual terminal also works. I used 'sudo chvt 2' instead of using
>> 'Ctrl+Alt+F2' because I couldn't send the hot key through webui kvm.
>> Also, instead of clicking the 'refresh' button, I changed web page
>> to the 'Server overview' page and changed it back to
>> 'Server control -> KVM' page. It works well.
>>
>> IMHO, you might want check the 'refresh' button handling logic in
>> webui implementation. Actually, the 'refresh' button is for system
>> info update, not for kvm screen update, anyways.
>>
>> Cheers,
>> Jae
>>
>>
>> On 2/20/2019 10:27 PM, xiuzhi wrote:
>>  > Hi Joe,
>>  >        It did work on EFI BIOS shell mode and OS GUI mode as your
>>  > screenshots.  It will fail on host OS console mode.
>>  > Please press "Ctrl+Alt+F2" to switch to OS console as the attachment
>>  > screenshot , then click the "Refresh" button, the issue will be 
>> reproduced.
>>  >     I updated the source
>>  > https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/18583/
>>  >    The ikvm window is black screen when the host OS screen start
>>  > dormancy or no LCD monitor device available .
>>  >    My BMC hardware is Ast2500.
>>  > Hi xiuzhi,
>>  > I tested it and checked that kvm through websocket works on both text
>>  > mode and gui mode of the host. Please find captured image I'm 
>> attaching.
>>  >
>>  > As you experienced, current kvm implementation is a bit unstable.
>>  > In case it doesn't work, restart 'start-ipkvm' service and try again.
>>  >
>>  > # systemctl stop start-ipkvm
>>  > # systemctl start start-ipkvm
>>  >
>>  > If the issue is relating to the host wake-up event, please try this:
>>  > https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/18583/
>>  >
>>  > Since it still needs lots of improvement, your debugging and
>>  > contribution on this kvm function would be very appreciated.
>>  >
>>  > Thanks,
>>  > Jae
>>  >
>>  >
>>  > On 2/19/2019 6:01 PM, xiuzhi wrote:
>>  >  > Hi Jae,
>>  >  >     The issue can be reproduced by the following cases:
>>  >  > 1) the ikvm engine driver is from
>>  >  > https://lists.ozlabs.org/pipermail/openbmc/2019-January/014523.html
>>  >  > 2) ikvm handler patch is from:
>>  >  >
>>  > 
>> https://github.com/Nuvoton-Israel/openbmc/blob/master/meta-evb/meta-evb-nuvoton/meta-evb-npcm750/recipes-phosphor/interfaces/phosphor-rest/0001-add-kvm-handler.patch 
>>
>>  >  > 3) webui is from
>>  >  > 
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/
>>  >  >
>>  >  > Case1, Start the host OS to GUI mode, click the "refresh" Button on
>>  >  > https://xxx.xxx.xxx.xxx/#/kvm page.
>>  >  >
>>  >  > Case2,  switch hostOS to console mode, click the "refresh" 
>> Button on
>>  >  > https://xxx.xxx.xxx.xxx/#/kvm page.
>>  >  >
>>  >  > 1,Using obmc-ikvm commit 7dfac9ff2d1569aedf83175fb0427562c2188e63
>>  >  > case1 is OK
>>  >  > case2 refresh page fail, can not get the host screen.
>>  >  >
>>  >  > 2,Using obmc-ikvm commit
>>  >  >   b9c253dca682d01e076ec6240ade2db151aec81a
>>  >  > case1 is OK
>>  >  > case2 is OK
>>  >  >
>>  >  > Best,
>>  >  > xiuzhi
>>  >  > ------------------ Original ------------------
>>  >  > *From: * "jae.hyun.yoo";<jae.hyun.yoo@linux.intel.com>;
>>  >  > *Date: * Feb 20, 2019
>>  >  > *To: * "xiuzhi"<1450335857@qq.com>; 
>> "openbmc"<openbmc@lists.ozlabs.org>;
>>  >  > *Subject: * Re: obmc-ikvm host OS console mode issue
>>  >  >
>>  >  > Hi xiuzhi,
>>  >  >
>>  >  > I don't think the commit causes the issue. Check aspeed-video 
>> driver
>>  >  > module in kernel that what happens on video mode change events.
>>  >  >
>>  >  > Cheers,
>>  >  > Jae
>>  >  >
>>  >  > On 2/19/2019 12:26 AM, xiuzhi wrote:
>>  >  >  > Hi Jae,
>>  >  >  >     I updated the obmc-ikvm commit
>>  >  > 7dfac9ff2d1569aedf83175fb0427562c2188e63
>>  >  >  >   It caused one issue:
>>  >  >  > The ikvm only works on linux OS GUI mode,
>>  >  >  > When I switch to os console mode, the ikvm can't get the host 
>> screen.
>>  >  >  > Please check you commit.
>>  >  >  >
>>  >  >  > Best,
>>  >  >  > xiuzhi
>>  >
