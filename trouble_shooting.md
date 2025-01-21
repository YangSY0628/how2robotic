## Troubleshooting

### Simulator Stuck When Loading Multiple Robots
- pt_main_thread occupy 300% cpu shown on 'top'
### Scene Model Mass Too Small or How to Stick to the Ground


### set tita to kinematic enables
- if set baselink as kinematic, joint between baselink and hips will act very wired(seperated)
- if set all parts as kinematic, all joints will report error: connot creat a joint between static bodies, and all parts will be seperated from each other.
- Instead, setting all parts as non-rigid body seems ok.