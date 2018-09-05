Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4255l76Cs8zF38R
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 00:32:35 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w85EV7sq147381
 for <openbmc@lists.ozlabs.org>; Wed, 5 Sep 2018 10:32:33 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2maggdj0db-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Sep 2018 10:32:32 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 5 Sep 2018 08:32:31 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Sep 2018 08:32:28 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w85EWS8u46268640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Sep 2018 07:32:28 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E787AC6057;
 Wed,  5 Sep 2018 08:32:27 -0600 (MDT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 550F0C605D;
 Wed,  5 Sep 2018 08:32:24 -0600 (MDT)
Received: from oc6728276242.ibm.com (unknown [9.80.225.205])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Sep 2018 08:32:23 -0600 (MDT)
Subject: Re: KVM Support?
To: KWLIU@nuvoton.com, 1450335857@qq.com, Avi.Fishman@nuvoton.com,
 ed.tanous@intel.com, openbmc@lists.ozlabs.org
References: <cc11de6844814426a96630c20fddaf46@NTHCML01A.nuvoton.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 5 Sep 2018 09:32:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cc11de6844814426a96630c20fddaf46@NTHCML01A.nuvoton.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18090514-0036-0000-0000-00000A317891
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009676; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01083924; UDB=6.00559413; IPR=6.00863925; 
 MB=3.00023126; MTD=3.00000008; XFM=3.00000015; UTC=2018-09-05 14:32:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18090514-0037-0000-0000-000048D5DA5B
Message-Id: <efe653ab-f881-ee13-3d8c-a8a801fe23ac@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809050152
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
X-List-Received-Date: Wed, 05 Sep 2018 14:32:36 -0000



On 09/05/2018 02:43 AM, KWLIU@nuvoton.com wrote:
>
> Hi Xiuzhi:
>
> From your system log, I think the problem is on the Aspeed video 
> driver(apsedd-video.c).
>
> But I don’t have any Aspeed platforms at hand and can’t really help 
> you to debug this issue,
>
> maybe you can increase timeout value of mode detection or wait for 
> Eddie’s comments.
>

That is correct, it seems to take quite some time for the host 
resolution change to actually take effect. In my latest upstream version 
I have 1 retry on the mode detection as well as a longer timeout, so you 
could pull that in from the linux-kernel list, or wait for integration 
into openbmc/linux.

You have to restart the obmc-ikvm application in this case.

Thanks,
Eddie

> If you want to auto start/restart obmc-ikvm, you must add a service 
> file for systemd service.
>
> You can refer to below links.
>
> 1.https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/interfaces/phosphor-gevent/phosphor-gevent.service 
>
>
> 2.https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/interfaces/phosphor-gevent.bb
>
> 3.https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/blob/openbmc-master/recipes-graphics/obmc-ikvm/obmc-ikvm/obmc-ikvm.service
>
> 4.https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/blob/openbmc-master/recipes-graphics/obmc-ikvm/obmc-ikvm.bb
>
> Thanks,
>
> Joseph
>
> *From:*xiuzhi [mailto:1450335857@qq.com]
> *Sent:* Wednesday, September 05, 2018 1:48 PM
> *To:* IS20 Avi Fishman; CS20 KWLiu; Eddie James; Tanous, Ed; openbmc
> *Subject:* Re:RE: Re:RE: KVM Support?
>
> Hi  Eddie,Joseph,
>
>     The webui can't get ikvm video when the host resolution changed .
>
> I must kill the process :python /usr/sbin/phosphor-gevent rest_dbus.py
>
> and restart obmc-ikvm -v /dev/video0 -i /dev/hidg0
>
> Then the kvm on webui can get the host video image .
>
> The system log is:
>
>   [ 9052.912683] aspeed-video 1e700000.video: resolution changed; 
> resetting
>
> [ 9054.406876] aspeed-video 1e700000.video: timed out on 1st mode detect
>
> [ 9054.413380] aspeed-video 1e700000.video: resolution changed; 
> couldn't get new resolution
>
> Do you have any idea to auto restart the obmc-ikvm and ?rest_dbus.py
>
> xiuzhi
>
> ------------------ Original ------------------
>
> *From: * "Avi.Fishman";<Avi.Fishman@nuvoton.com 
> <mailto:Avi.Fishman@nuvoton.com>>;
>
> *Date: * Aug 29, 2018
>
> *To: * "KWLIU"<KWLIU@nuvoton.com <mailto:KWLIU@nuvoton.com>>; 
> "xiuzhi"<1450335857@qq.com <mailto:1450335857@qq.com>>; 
> "eajames"<eajames@linux.vnet.ibm.com 
> <mailto:eajames@linux.vnet.ibm.com>>; "ed.tanous"<ed.tanous@intel.com 
> <mailto:ed.tanous@intel.com>>; "openbmc"<openbmc@lists.ozlabs.org 
> <mailto:openbmc@lists.ozlabs.org>>;
>
> *Subject: * RE: Re:RE: KVM Support?
>
> Hi Xiuzhi,
>
> Can you take the patches and merge them to your environment?
>
> Josef,
>
> Maybe you need to give the commit or tag you are that above it you use 
> your patches?
>
> Thanks,
>
> Avi
>
> *From:*openbmc 
> <openbmc-bounces+avifishman70=gmail.com@lists.ozlabs.org 
> <mailto:openbmc-bounces+avifishman70=gmail.com@lists.ozlabs.org>> *On 
> Behalf Of *CS20 KWLiu
> *Sent:* Wednesday, August 29, 2018 5:44 AM
> *To:* 1450335857@qq.com <mailto:1450335857@qq.com>; 
> eajames@linux.vnet.ibm.com <mailto:eajames@linux.vnet.ibm.com>; 
> ed.tanous@intel.com <mailto:ed.tanous@intel.com>; 
> openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
> *Subject:* RE: Re:RE: KVM Support?
>
> Hi Xiuzhi:
>
> I think we are using different bases of the openbmc, this patch is 
> really working on my side
>
> Sorry for I cannot find the exact error in your message.
>
> Thanks,
>
> Joseph
>
> *From:*xiuzhi [mailto:1450335857@qq.com]
> *Sent:* Tuesday, August 28, 2018 6:57 PM
> *To:* Eddie James; Tanous, Ed; CS20 KWLiu; openbmc
> *Subject:* Re:RE: KVM Support?
>
> Hi Joseph, Ed,
>   There was an error when I  updated the patches 
> https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f0364290cce669609088ac 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_Nuvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Daddon_commit_140771b7e898dd5ca8f0364290cce669609088ac&d=DwMGAw&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=Zir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO0HuXocMRt5n0&e=>
>
> Would you like to give me some suggestions to debug it?  When I logged 
> in https://<bmc_ip>/#/kvm 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__-253cbmc-5Fip-253e_-23_kvm&d=DwMFAg&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=kNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&m=xFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&s=2J0BHCud5wpV8zxnLKS_sDp79AfVxVQvJ5Vk3r8dhTc&e=>, 
> The errors read: " WebSocket on-close event  
> app.89eaa0b6e5e9417cb602.js:38:675915 Failed when connecting: 
> Connection closed (code: 1005)  app.89eaa0b6e5e9417cb602.js:38:685584 
>         RFB.prototype._fail 
> https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:685584 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__192.168.120.132_app.89eaa0b6e5e9417cb602.js-3A38-3A685584&d=DwMFAg&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=kNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&m=xFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&s=EgJDf5jL_gme8t1tF_wjg1-08xZxvqptSjoW3a8zohU&e=> 
>         RFB/< 
> https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:676138 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__192.168.120.132_app.89eaa0b6e5e9417cb602.js-3A38-3A676138&d=DwMFAg&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=kNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&m=xFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&s=dIWffzOhDWjQl-iTTJj_38z606ai7gLJSynBqbAZXW8&e=> 
>         Websock.prototype.open/this._websocket.onclose< 
> https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:778159 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__192.168.120.132_app.89eaa0b6e5e9417cb602.js-3A38-3A778159&d=DwMFAg&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=kNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&m=xFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&s=oJ5yHA_oCl5ihumZXKGL7rDbby1iZ0j2J4hWMLB-hEY&e=> 
> New state 'disconnecting', was 'connecting'.  
> app.89eaa0b6e5e9417cb602.js:38:684301 >> RFB.disconnect  
> app.89eaa0b6e5e9417cb602.js:38:680495 >> Keyboard.allKeysUp  
> app.89eaa0b6e5e9417cb602.js:38:739659 << Keyboard.allKeysUp  
> app.89eaa0b6e5e9417cb602.js:38:739828 " The line 38 of 
> app.89eaa0b6e5e9417cb602.js is : void 0!==module&&void 
> 0!==exports&&module.exports===exports&&(module.exports="ui.router"),function(window,angular,undefined){"use 
> strict";var 
> $$UMFP,isDefined=angular.isDefined,isFunction=angular.isFunction,isString=angular.isString,isObject=angular.isObject,isArray=angular.isArray,forEach=angular.forEach,extend=angular.extend,copy=angular.copy,toJson=angular.toJson;function 
> inherit(parent,extra){return 
> extend(new(extend(function(){},{prototype:parent})),extra)}function 
> merge(dst){return 
> forEach(arguments,function(obj){obj!==dst&&forEach(obj,function(value,key){dst.hasOwnProperty(key)||(dst[key]=value)})}),dst}function 
> objectKeys(object){if(Object.keys)return Object.keys(object);var 
> result=[];return 
> forEach(object,function(val,key){result.push(key)}),result}function 
> indexOf(array,value){if(Array.prototype.indexOf)return 
> array.indexOf(value,Number(arguments[2])||0);var 
> len=array.length>>>0,from=Number(arguments[2])||0;for((from=from<0?Math.ceil(from):Math.floor(from))<0&&(from+=len);from<len;from++)if(from 
> in array&&array[from]===value)return from;return-1}function 
> inheritParams(currentParams,newParams,$current,$to) ... ... Best, 
> Xiuzhi >Hi Eddie & Ed:
> >Do you have any plan to support non-jpeg video stream in obmc-iKVM?
> >It is possible some platforms don't have hardware JPEG engine, instead have the RGB video stream.
> >If possible to support RGB video stream, I think it would be better if you can add the video frame differentiation in obmc-iKVM because we don't need to send the full screen >to VNC client on every request, it can reduce the buffer size at least. (libvncserver already has the video frame differentiation)
> >Also, I have implemented a KVM application for our platform(nuvoton evb-npcm750) which has hardware video frame differentiation and hardware hextile engine.
> https://github.com/Nuvoton-Israel/obmc-ikvm 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_Nuvoton-2DIsrael_obmc-2Dikvm&d=DwMGAw&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=Zir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=92D29zgWEhIBYgHR9Q7lkZzREnMSwnqyhl1nEMyqXFM&e=>
> https://github.com/Nuvoton-Israel/linux/commit/7e90f572323e56e9425b85aafe86dfa5a35c4e7d 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_Nuvoton-2DIsrael_linux_commit_7e90f572323e56e9425b85aafe86dfa5a35c4e7d&d=DwMGAw&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=Zir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=1JBlTPOERz49VFrLgiw014ZnBqab0r8xdRIe6Fee1JA&e=>
> >I also enabled ED's KVM webui and added kvmws proxy in python web server.
> https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f0364290cce669609088ac 
> <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_Nuvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Daddon_commit_140771b7e898dd5ca8f0364290cce669609088ac&d=DwMGAw&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=Zir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO0HuXocMRt5n0&e=>
> >If you can spare a few minutes to review my implementation is my pleasure.
> >Currently, my video driver is not v4l2, so I am going to redesign it to fit v4l2 and your obmc-iKVM, then I will try to add the RGB format support in your obmc-ikvm.
> >Regarding the larger binary size, I think we need to review all configurations of libvncserver and check which functions should be disabled.
> >Thanks,
> >Joseph Liu.
>
>
>
> ===========================================================================================
> The privileged confidential information contained in this email is 
> intended for use only by the addressees as indicated by the original 
> sender of this email. If you are not the addressee indicated in this 
> email or are not responsible for delivery of the email to such a 
> person, please kindly reply to the sender indicating this fact and 
> delete all copies of it from your computer and network server 
> immediately. Your cooperation is highly appreciated. It is advised 
> that any unauthorized use of confidential information of Nuvoton is 
> strictly prohibited; and any information in this email irrelevant to 
> the official business of Nuvoton shall be deemed as neither given nor 
> endorsed by Nuvoton.
>
>
>
> ===========================================================================================
> The privileged confidential information contained in this email is 
> intended for use only by the addressees as indicated by the original 
> sender of this email. If you are not the addressee indicated in this 
> email or are not responsible for delivery of the email to such a 
> person, please kindly reply to the sender indicating this fact and 
> delete all copies of it from your computer and network server 
> immediately. Your cooperation is highly appreciated. It is advised 
> that any unauthorized use of confidential information of Nuvoton is 
> strictly prohibited; and any information in this email irrelevant to 
> the official business of Nuvoton shall be deemed as neither given nor 
> endorsed by Nuvoton.
>
>
>
> ===========================================================================================
> The privileged confidential information contained in this email is 
> intended for use only by the addressees as indicated by the original 
> sender of this email. If you are not the addressee indicated in this 
> email or are not responsible for delivery of the email to such a 
> person, please kindly reply to the sender indicating this fact and 
> delete all copies of it from your computer and network server 
> immediately. Your cooperation is highly appreciated. It is advised 
> that any unauthorized use of confidential information of Nuvoton is 
> strictly prohibited; and any information in this email irrelevant to 
> the official business of Nuvoton shall be deemed as neither given nor 
> endorsed by Nuvoton.
