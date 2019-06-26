import { Component, OnInit} from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
password:string;
  constructor(private userService:UserService, private router: Router) { }

  ngOnInit() {
  }
  onLogin(){
    this.userService.login(this.password)
      .subscribe(
        res=>this.router.navigateByUrl(''),
        err=>alert(err)
        );
  }
}
